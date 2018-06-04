# Specifications for the CLI Assessment

Specs:
- [x] Have a CLI for interfacing with the application

    bin/martial-arts-console requires lib/martial_arts.rb, which serves as the environment and talks to
    lib/martial_arts/cli.rb where the user can interface with the application. From cli.rb the various instance methods displays its menu
    options based on user input and returns the request waiting for further instructions which will involve entering commands to
    display info, lists, go back, or again require user input.

- [x] Pull data from an external source

  For this CLI the information is pulled from http://www.singpatong-sitnumnoi.com/10-most-popular-martial-arts/ for the most popular
  list.
  https://en.wikipedia.org/wiki/List_of_martial_arts for names of all known martial arts and its country.
  and
  https://en.wikipedia.org/- style name - for more informaiton about the style.

- [x] Implement both list and detail views

  Lists:
        - Popular martial arts
        - Countries with martial arts
        - All styles
        - Fighting_Focus

  Detail Views:
        - Style name
        - Country
        - Fighting_Focus
        - Description
        - Wiki website
