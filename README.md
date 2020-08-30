# react-native-mapkit-local-search

mapkit local search

## Installation

```sh
npm install react-native-mapkit-local-search
```

## Usage

```js
import MapkitLocalSearch from "react-native-mapkit-local-search";

// ...
try {
  const region = {
    latitude: 30.2669444,
    longitude: -97.7427778,
    latitudeDelta: 0.1,
    longitudeDelta: 0.1
  }

  const result = await MapkitLocalSearch.searchForLocations(
    'Popeyes',
    region
  );
} catch (error) {
  console.log(error);
}
```
## Request
To call the `searchForLocations` function, specify a <SEARCH_TERM> and <REGION>. <SEARCH_TERM> is a `string` while <REGION> is an `object` with the following attributes: `latitude`, `longitude`, `latitudeDelta`, `longitudeDelta`

## Response
Result returned from `searchForLocations` function call returns an `array` containing objects with the following attributes: `name`, `title`, `latitude`, `longitude`.

## Contributing

See the [contributing guide](CONTRIBUTING.md) to learn how to contribute to the repository and the development workflow.

## License

MIT
