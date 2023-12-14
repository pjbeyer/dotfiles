Phil's Dotfiles
===============

My `dotfiles` leverage [Dotbot][dotbot] for installation and are designed to be compatible with [strap][strap].

Getting Started
---------------

To get started on your `dotfiles` with [Dotbot][dotbot], you can [bootstrap from this template][template] or [fork this repository][fork].

In general, you should be using symbolic links for everything, and using `git` submodules whenever possible.

To keep submodules at their proper versions, you could include something like `git submodule update --init --recursive` in your `install.conf.yaml`.

To upgrade your submodules to their latest versions, you could periodically run `git submodule update --init --remote`.

Making Local Customizations
---------------------------

My `dotfiles` support local customization and machine-specific configuration using a separate, private repository. See [@anishathalye][@anishathalye]'s [dotfiles-local][anishathalye_dotfiles-local] for a detailed explanation with examples.

Credit
------

Thank you [@anishathalye][@anishathalye] for [Dotbot][dotbot] and for the example of your own [dotfiles][anishathalye_dotfiles] and [dotfiles-local][anishathalye_dotfiles-local]. If anyone is looking for further inspiration, there are [many more Dotbot users available to peruse][dotbot-users].

License
-------

This software is hereby released into the public domain. That means you can do whatever you want with it without restriction. See `LICENSE` for details.

[dotbot]: https://github.com/anishathalye/dotbot
[strap]: https://github.com/MikeMcQuaid/strap
[template]: https://github.com/anishathalye/dotfiles_template/generate
[fork]: https://github.com/anishathalye/dotfiles_template/fork
[@anishathalye]: https://github.com/anishathalye
[anishathalye_dotfiles-local]: https://github.com/anishathalye/dotfiles-local
[anishathalye_dotfiles]: https://github.com/anishathalye/dotfiles
[dotbot-users]: https://github.com/anishathalye/dotbot/wiki/Users
