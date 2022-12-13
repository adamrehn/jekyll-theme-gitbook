# GitBook-inspired documentation theme for Jekyll

This is a documentation theme for [Jekyll](https://jekyllrb.com/) that takes its inspiration primarily from the visual design language of [GitBook](https://www.gitbook.com/), along with elements from the [Docker Documentation](https://docs.docker.com/) and tweaks to suit the personal preferences of the author. Note that this theme does not reuse any code from the sites from which it draws inspiration, and is written from first principles using [Bootstrap](https://getbootstrap.com/).

This theme is designed to be highly configurable, whilst providing sensible defaults for most options in order to make it as easy as possible to get up and running quickly. See the [Configuration](#configuration) section for details of the available settings.

**You can view a [live demo of this theme here](https://adamrehn.github.io/jekyll-theme-gitbook-demo) and view the [source code for the demo site here](https://github.com/adamrehn/jekyll-theme-gitbook-demo).**


## Contents

- [Installation](#installation)
  - [GitHub Pages](#github-pages)
  - [Other hosts (e.g. GitLab Pages)](#other-hosts-eg-gitlab-pages)
- [Configuration](#configuration)
  - [Top-level Jekyll configuration](#top-level-jekyll-configuration)
    - [Theme configuration](#theme-configuration)
    - [Front matter defaults](#front-matter-defaults)
  - [Site structure](#site-structure)
    - [Stylesheet and image assets](#stylesheet-and-image-assets)
    - [Content structure: pages](#content-structure-pages)
    - [Content structure: chapters](#content-structure-chapters)
    - [Content structure: site root](#content-structure-site-root)
  - [CSS styles](#css-styles)
  - [Hooks](#hooks)
  - [Advanced options](#advanced-options)
- [Legal](#legal)


## Installation

### GitHub Pages

If you are hosting your site on GitHub Pages then add the following line to your site's `_config.yml` file (as per [the documentation](https://docs.github.com/en/github/working-with-github-pages/adding-a-theme-to-your-github-pages-site-using-jekyll)):

```yaml
remote_theme: "adamrehn/jekyll-theme-gitbook@v0.0.6"
```

### Other hosts (e.g. GitLab Pages)

If you are hosting your site using a service that permits the use of Gem-based themes then add the following line to your site's `Gemfile`:

```ruby
gem "jekyll-theme-gitbook"
```

Also add the following line to your site's `_config.yml` file:

```yaml
theme: "jekyll-theme-gitbook"
```


## Configuration

### Top-level Jekyll configuration

#### Theme configuration

All configuration data for this theme is stored under a top-level YAML key called `theme-settings`, which has the following structure (individual sections are explained below):

```yaml
theme-settings:
  
  
  # The name of the Jekyll collection that contains the site's chapters (REQUIRED)
  collection: "categories"
  
  
  # Navigation menu settings (OPTIONAL, only needed if you want to override the defaults)
  navigation:
    
    # Specifies whether navigation links should be generated for chapter index files that use the `chapter-index` layout (OPTIONAL, defaults to false)
    indices: false
    
    # Specifies whether the navigation links for each chapter should be output as collapsible sections using HTML <detail> tags, with chapter headings as <summary> tags (OPTIONAL, defaults to false)
    collapsible: false
    
    # When collapsible sections are enabled, specifies whether sections are collapsed by default (OPTIONAL, defaults to false)
    collapsed: false
  
  
  # Copyright settings for the page footer (REQUIRED)
  copyright:
    
    # The author for the copyright notice (REQUIRED, supports markdown formatting)
    author: "Site Author"
    
    # The starting year for the copyright notice (REQUIRED)
    # (The theme will automatically use the current year as the ending year for the copyright notice)
    year: 2020
    
    # The license for the copyright notice (OPTIONAL, supports markdown formatting, defaults to "All rights reserved.")
    license: "Your custom license here."
  
  
  # Override the path to the site's logo image (OPTIONAL, defaults to "/assets/images/logo.svg")
  logo: "/path/to/logo.png"
  
  
  # Override the path to the site's Open Graph image (OPTIONAL, defaults to "/assets/images/opengraph.png")
  opengraph: "/path/to/opengraph.png"
  
  
  # Favicon settings (OPTIONAL, only needed if you want to override the defaults)
  favicon:
    
    # Override the PNG version of the favicon (OPTIONAL, defaults to "/assets/images/favicon.png")
    png: "/path/to/favicon.png"
    
    # Override the SVG version of the favicon (OPTIONAL, defaults to "/assets/images/favicon.svg")
    svg: "/path/to/favicon.svg"
  
  
  # Font Awesome icon settings (OPTIONAL, only needed if you want to override the defaults)
  fontawesome:
    
    # Specify that you are providing Font Awesome through your own CSS (OPTIONAL, defaults to false)
    local: true
    
    # Specify a Font Awesome Kit URL to provide icons (OPTIONAL, defaults to none, takes precedence over "local" if both are specified)
    kit: "https://kit.fontawesome.com/xxxxxxxxxx.js"
    
    # Override individual Font Awesome icons (OPTIONAL, only needed if you want to override the defaults)
    icons:
      
      # Override the "return to top" icon (OPTIONAL, defaults to "fa-arrow-up")
      # (Incidentally, if you do have a Font Awesome Pro license then this particular icon override is highly recommended)
      top: "fa-arrow-alt-to-top"
      
      # Other icon overrides go here (see the full list of supported overrides below)
      # ...
```

Each key in this structure serves a specific purpose:

- `collection`: the theme uses a book metaphor to describe the structure of content. The site is broken down into a series of "chapters", each containing a series of pages. Of course, this naming convention does not make sense for all sites (for some sites, the "chapters" may in fact be referred to as sections or categories) and so the theme does not force you to adopt the name "chapters" in your filesystem structure. Instead, you can specify any [Jekyll collection](https://jekyllrb.com/docs/collections/) to act as your list of chapters, typically using one subdirectory per chapter to group pages. **You must specify the name of the Jekyll collection as a string value for this key.**

- `navigation`: this key groups settings for overriding the behaviour of the site's navigation links. **This key and all of its subkeys are optional:**
    
    - Subkey `indices`: by default, the theme only generates navigation links to each of the pages in each chapter, not to the chapter indices themselves. You can set this subkey to `true` if you would like to trigger the generation of chapter index navigation links, although note that links are only generated for chapters whose `index.html` files use the `chapter-index` layout and not for chapters whose index use the `chapter-redirect` layout.
    
    - Subkeys `collapsible` and `collapsed`: these subkeys allow you to make the sections of the navigation menu for each chapter collapsible, and specify whether they are collapsed or expanded by default, respectively.
    

- `copyright`: this key groups settings related to the copyright notice that appears in the footer of all pages. **This key and the `author` and `year` subkeys are required,** whilst the `license` subkey is optional.

- `logo`: this key overrides the default path to the site's logo image, which will be displayed in the header of all pages. Although the default value uses an `.svg` file extension, the logo image can be in any format supported by a web browser, it does not need to be an SVG file. **This key is optional.**

- `opengraph`: this key overrides the default path to the site's [Open Graph](https://ogp.me/) image, which will be displayed in link previews whenever you post a link to your site in software that is compatible with the Open Graph protocol. Although the default value uses a `.png` file extension, the logo image can be in any format supported by a web browser, it does not need to be an PNG file. **This key is optional.**

- `favicon`: this key groups settings for overriding the default path to the site's [favicon](https://en.wikipedia.org/wiki/Favicon) image, which is typically displayed in web browser page tabs. The `png` and `svg` subkeys allow you to override the PNG and SVG versions of the favicon image, respectively, and must point to image files in the correct format if specified. **This key and both of its subkeys are optional.**

- `fontawesome`: this key groups settings for configuring the theme's use of the [Font Awesome](https://fontawesome.com/) icon font. By default, the theme will use [the free version of Font Awesome version 5.13](https://use.fontawesome.com/releases/v5.13.1/css/all.css) and a sensible set of default icons for various user interface elements. If you have a Font Awesome Pro license then you can use the `local` or `kit` subkeys to instruct the theme to use your own version of Font Awesome Pro. If you specify `local: true` then the theme assumes you are providing Font Awesome via your own CSS and does not generate any code to include it. If you specify a value for `kit` then the theme will generate code to use that Font Awesome Kit URL. (If you specify both `local` and `kit` then the `kit` value takes precedence.) If neither `local` or `kit` are specified then the theme will generate code to use the default Font Awesome Free CSS. Irrespective of whether you are using the default Font Awesome Free or your own Font Awesome Pro, you can use the `icons` subkey to override any of the default values for the individual icons used throughout the theme. **This key and all of its subkeys are optional.**

The following icon overrides are supported:

|Icon                                                                      |Key                          |Default                                                                              |
|--------------------------------------------------------------------------|-----------------------------|-------------------------------------------------------------------------------------|
|Navigation menu toggle button                                             |`fontawesome.icons.nav`      |[fa-bars](https://fontawesome.com/icons/bars?style=solid)                            |
|Table of contents icon                                                    |`fontawesome.icons.contents` |[fa-list](https://fontawesome.com/icons/list?style=solid)                            |
|Default chapter icon at top of page if chapter doesn't have a custom icon |`fontawesome.icons.page`     |[fa-angle-double-right](https://fontawesome.com/icons/angle-double-right?style=solid)|
|Return to top icon                                                        |`fontawesome.icons.top`      |[fa-arrow-up](https://fontawesome.com/icons/arrow-up?style=solid)                    |
|Left arrow in page navigation                                             |`fontawesome.icons.left`     |[fa-arrow-left](https://fontawesome.com/icons/arrow-left?style=solid)                |
|Right arrow in page navigation                                            |`fontawesome.icons.right`    |[fa-arrow-right](https://fontawesome.com/icons/arrow-right?style=solid)              |

#### Front matter defaults

Once you have populated the theme configuration itself, you will likely want to use Jekyll [front matter defaults](https://jekyllrb.com/docs/configuration/front-matter-defaults/) to configure the metadata for your content's chapters in a clean and concise manner. The following example demonstrates a site with three chapters stored in a Jekyll collection called "sections" (since the chapter metaphor does not restrict your filesystem naming conventions), with a subdirectory to hold the pages for each chapter:

```yaml
# Configure the permalinks for each category ("chapter" from the theme's perspective)
collections_dir: _collections
collections:
  categories:
    output: true
    permalink: /:path

# Use front matter defaults to supply the metadata for each category
defaults:
  -
    scope:
      path: ""
      type: "sections"
    values:
      
      # Use the "default" layout provided by the theme for all pages
      layout: "default"
  -
    scope:
      
      # This is the filesystem path for the subdirectory containing the category's pages
      path: "_collections/_categories/basic"
      
    values:
      
      # The chapter name and number are required
      chapter: "Basic"
      chapnum: 1
      
      # An icon is optional and will be displayed next to the chapter name if specified
      icon: "fas fa-school"
      
  -
    scope:
      path: "_collections/_categories/intermediate"
    values:
      chapter: "Intermediate"
      chapnum: 2
      icon: "fas fa-university"
  -
    scope:
      path: "_collections/_categories/advanced"
    values:
      chapter: "Advanced"
      chapnum: 3
      icon: "fas fa-graduation-cap"
```

### Site structure

#### Stylesheet and image assets

The theme places no requirements on the structure of sites that use it, but the default configuration values do assume a number of paths for image assets and stylesheets. If you have not overridden these paths in your site's `_config.yml` file or hooks then the theme uses the following defaults:

- Main CSS file: `/assets/css/style.css` (override by providing your own `_includes/hooks/head-posthook.html` file, see [Hooks](#hooks) below for details)
- Logo image: `/assets/images/logo.svg` (override with `theme-settings.logo` in `_config.yml`)
- PNG version of favicon: `/assets/images/favicon.png` (override with `theme-settings.favicon.png` in `_config.yml`)
- SVG version of favicon: `/assets/images/favicon.svg` (override with `theme-settings.favicon.svg` in `_config.yml`)
- OpenGraph image: `/assets/images/opengraph.png` (override with `theme-settings.opengraph` in `_config.yml`)

#### Content structure: pages

If you have structured your pages into chapter subdirectories and configured their front matter defaults in the manner described above, then there are only two front matter variables that need to be specified for each individual page:

```yaml
---
title: The title of the page
pagenum: 1
---

Page content goes here.
```

**Each page must specify both a `title` and a page number using the `pagenum` front matter variable**, to allow page links to be generated correctly and to be sorted within each chapter. All other front matter variables are optional. Note that if you override the `chapter` or `chapnum` values in a page's front matter with values that differ from those specified in the front matter defaults then the values from the page's front matter will take precedence and will produce inconsistent results. For that reason, it is strongly recommended that you specify `chapter` and `chapnum` exclusively within the front matter defaults.

#### Content structure: chapters

Each chapter should also include an `index.html` file, which should specify either the `chapter-index` or `chapter-redirect` layout and can optionally include a chapter description:

```yaml
---
layout: chapter-redirect
---

Optional description of this chapter goes here.
```

The layout you choose will determine the site's behaviour when navigating to the index for a chapter (which is resolved automatically when referencing a subdirectory's path without a trailing page path.) Choose the `chapter-index` layout if you would like the web browser to display a list of links to the pages in the chapter, or the `chapter-redirect` layout if you would like the web browser to automatically redirect to the first page in the chapter.

If you choose to provide a chapter description then this will be displayed on the chapter's index page when using the `chapter-index` layout, and will also be displayed under the chapter's name if you generate a list of chapters with the `chapter-list.html` include (which is designed to be used on the front page of a site.)

If you use the `chapter-index` layout for a chapter and the global setting `theme-settings.navigation.indices` is set to `true` then a link will be generated for the chapter index in the site's navigation sidebar.

#### Content structure: site root

You can specify custom content for the site's front page by providing an `index.html` or `index.md` file in the root of your site's filesystem directory. The `chapter-list.html` include that ships with the theme is designed for use from the site root, and generates a list of chapters for you (with per-chapter descriptions included if they were specified.)

If you do not want to have a custom front page then you can use the `root-redirect` layout to instruct web browsers to automatically redirect to the index of the first chapter (which may in turn redirect to the first page of that chapter if you specified that behaviour, as discussed in the previous section):

```yaml
---
layout: root-redirect
---
```

### CSS styles

If you use the theme's default settings then your site is expected to have an `assets/css/style.scss` file with the following contents as a minimum:

```scss
---
---
@import '{{ site.theme }}';
```

You can change the list of CSS files that get included in the site's `<head>` tag by providing your own `_includes/hooks/head-posthook.html` file, as described in the [Hooks](#hooks) section below. Irrespective of whether you use the default CSS filesystem path or a custom list of paths, at least one CSS file will need to include the theme's CSS styles using the code above. You can then add your own CSS rules to augment or override the default theme styles.

Note that **this theme does not ship with CSS styles for syntax highlighting code blocks**, so you will need to provide your own styles for syntax highlighting if your content includes code blocks. There are a wide variety of styles available online, although be sure to check that your chosen style rules are compatible with the output of whichever [markdown processor](https://jekyllrb.com/docs/configuration/markdown/) you have configured Jekyll to use.

### Hooks

In addition to the configuration options discussed in the sections above, you can control the HTML output of your site by using a set of supported include files that the theme refers to as "hooks". The default contents of these hooks are located in the theme's [`_includes/hooks`](https://github.com/adamrehn/jekyll-theme-gitbook/blob/master/_includes/hooks) subdirectory, and are used throughout the theme's default layout. To replace the contents of a given hook, simply create a file in your site's filesystem directory with the same filename (e.g. `_includes/hooks/head-posthook.html`) and Jekyll will automatically use your version of the file instead of the default version from the theme.

The following hooks are currently supported:

- `head-posthook.html`: included at the end of the site's `<head>` tag, this hook is used for providing additional `<meta>` tags, CSS files or Javascript files. The default version of this hook simply includes the CSS file `/assets/css/style.css`.

- `navbar-prehook.html`: included just before the start of the site's navigation menu, this hook allows you to add custom content to the start of the menu. The default version of this hook is empty.

- `navbar-posthook.html`: included just after the end of the site's navigation menu, this hook allows you to add custom content to the end of the menu. The default version of this hook is empty.

- `copyright-posthook.html`: included just after the license text of the copyright notice in the site's footer, this hook allows you to add custom footer text (e.g. to specify additional copyright information for third-party trademarks, etc.) The default version of this hook is empty.

- `body-posthook.html`: included at the end of the site's `<body>` tag, this hook is used for providing additional Javascript files or code. The default version of this hook is empty.

### Advanced options

The theme supports the following advanced configuration options:

- **Subsites:** in some scenarios, you may wish to host multiple, independent sites under a single domain which all use this theme with the same shared configuration values. (The [AdamRehn Docs](https://docs.adamrehn.com) site is an example of a site that does this.) Instead of creating multiple Jekyll sites in separate subdirectories and duplicating your configuration data, you can use a single Jekyll site with this theme and specify a `subsite` key in your front matter defaults to specify which subsite a given chapter belongs to. Each subsite will act like an entirely independent site with regards to the generation of navigation links, although any page which does not have a `subsite` front matter value defined (either directly or via front matter defaults) will see an aggregation of the chapters and pages for all subsites. In this scenario, you will need to create a custom site root page to link to each of your subsites in a meaningful manner, as the theme does not ship with functionality for generating this automatically.


## Legal

Copyright &copy; 2020 - 2022, Adam Rehn. Licensed under the MIT License, see the file [LICENSE](https://github.com/adamrehn/jekyll-theme-gitbook/blob/master/LICENSE) for details.

The following third-party libraries are bundled in the theme's source tree and are covered by their respective licenses:

- [Bootstrap](https://getbootstrap.com/) ([MIT License](https://github.com/twbs/bootstrap/blob/main/LICENSE))
- [jQuery](https://jquery.com/) ([MIT License](https://github.com/jquery/jquery/blob/master/LICENSE.txt))
- [Popper](https://popper.js.org/) ([MIT License](https://github.com/popperjs/popper-core/blob/master/LICENSE.md))
- [Jekyll Pure Liquid Table of Contents](https://github.com/allejo/jekyll-toc) (dual-license [BSD-3](https://github.com/allejo/jekyll-toc/blob/master/LICENSE.BSD3.md) or [MIT](https://github.com/allejo/jekyll-toc/blob/master/LICENSE.MIT.md))
