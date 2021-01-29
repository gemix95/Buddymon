# Buddymon

Buddymon è un pokedex che utilizza le API di [pokeapi.co](https://pokeapi.co/) per mostrare informazioni e statistiche su una lista di oltre 800 pokemons.

## Architettura
Di seguito i punti chiave dell'architettura dell'app:

```
- L'app utilizza un architettura MVVM con l'aiuto di Coordinator
- L'app non utilizza né storyboard né xib
- Uso di generics per i dataSource delle tableView
- Utilizzo di un solo pod per il download e lo store in cache delle immagini: 'SDWebImage'
```
