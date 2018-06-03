MartialArtsCLI will be a command-line app to allow users to search for the 10 most popular martial arts in the world. When the app is run, the user will be greeted, and asked to enter a number corresponding to a prompt. The available prompts will be ‘Top 10 list’, ‘Martial Arts by country’, ‘Martial Arts Styles’, ‘Fighting-focus’, and ‘quit’ program.

When they choose ‘Top 10 list’ the user will see a list of popular martial arts styles that are scraped from Google’s list at the top of the page, using ‘popular martial arts in the world’ as the search keyword.  User will then enter the corresponding number to receive more information about the style selected. Information about the style will include name, country, focus, and description. This information will be scraped from Wikipedia's list of martial arts page and www.singpatong-sitnumnoi.com. Otherwise, user can enter ‘back’ to go back to the main menu.

When they choose ‘Martial Arts by Country’ the user will see a numbered list of countries and receive a prompt asking to enter a number corresponding to the country and it’s martial arts’ styles.  Otherwise, user can enter ‘back’ to go back to the main menu.

When they choose ‘Martial Art Styles’ the user will see a numbered list of styles and receive a prompt asking to enter a number corresponding to the style. Otherwise, user can enter ‘back’ to go back to the main menu.

When they choose ‘Martial Art Focus’ the user will see a numbered list corresponding to 1. Striking  2.  Grappling 3. Weaponry  4. Meditation. The user will then be asked to enter a number returning a list of martial arts styles that correspond to the method of attack. Otherwise, user can enter ‘back’ to go back to the main menu.

For the architecture, we’ll have the following:
	Class MartialArts to represent each style
	Class Focus to represent each fighting method
	Class Country to represent each countrie’s style
	Class MartialArtsScraper to will be used to create the styles


The first version of the app, the user will see the greeting and receive the list of the top 10 martial arts in the world, it’s info as well as search info for different styles.
