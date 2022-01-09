# Buddymon

Buddymon is a pokedex that uses the API from [pokeapi.co](https://pokeapi.co/) to display information and statistics on a list of over 800 pokemons.

## Architecture
The following are the key points of the app's architecture:

```
- The app uses an MVVM architecture with the help of Coordinator
- The app doesn't use storyboards or xibs
- Use of generics for tableView dataSources
- Use of only one pod for downloading and caching images: 'SDWebImage'.
```
