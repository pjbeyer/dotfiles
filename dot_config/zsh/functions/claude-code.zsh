# Claude Code launcher with MCP profile auto-detection
# Usage: cc [flags] [claude args...]
#   cc           - Auto-detect profile from directory
#   cc -s        - Interactive profile selection
#   cc -f        - Full profile (all servers)
#   cc -c        - Code profile (dev tools)
#   cc -w        - Work profile
#   cc -p        - Personal (pjbeyer) profile

cc() {
  local profile=""
  local select_mode=false
  local args=()
  local mcp_dir="${XDG_CONFIG_HOME:-$HOME/.config}/claude/mcp"

  # Parse flags
  while [[ $# -gt 0 ]]; do
    case "$1" in
      -s|--select) select_mode=true; shift ;;
      -f|--full) profile="full"; shift ;;
      -c|--code) profile="code"; shift ;;
      -w|--work) profile="work"; shift ;;
      -p|--personal) profile="pjbeyer"; shift ;;
      -y|--play) profile="play"; shift ;;
      *) args+=("$1"); shift ;;
    esac
  done

  # Interactive selection
  if $select_mode; then
    echo "MCP Profile:"
    echo "  [c]ore     - Meetings/docs/tasks (3 servers)"
    echo "  [w]ork     - Flex tools + Atlassian (7 servers)"
    echo "  [p]ersonal - Personal projects (4 servers)"
    echo "  [d]ev      - Code development (6 servers)"
    echo "  [f]ull     - All servers (15 servers)"
    read -k1 "choice?> "
    echo
    case "$choice" in
      w) profile="work" ;;
      p) profile="pjbeyer" ;;
      d) profile="code" ;;
      f) profile="full" ;;
      y) profile="play" ;;
      *) profile="core" ;;
    esac
  fi

  # Auto-detect from directory if no profile specified
  if [[ -z "$profile" ]]; then
    case "$PWD" in
      */Projects/work*) profile="work" ;;
      */Projects/pjbeyer*) profile="pjbeyer" ;;
      */Projects/play*) profile="play" ;;
      */Projects/home*) profile="core" ;;
      */Projects*) profile="core" ;;
      *) profile="core" ;;
    esac
  fi

  local config_file="${mcp_dir}/${profile}.json"

  if [[ -f "$config_file" ]]; then
    echo "MCP profile: $profile"
    claude --mcp-config "$config_file" "${args[@]}"
  else
    echo "Profile not found: $config_file"
    echo "Using claude without MCP config"
    claude "${args[@]}"
  fi
}
