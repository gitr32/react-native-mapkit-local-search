import * as React from 'react';
import { StyleSheet, View, Text } from 'react-native';
import MapkitLocalSearch, { Location } from 'react-native-mapkit-local-search';
import { useState } from 'react';

export default function App() {
  const [locations, setLocations] = useState<Location[]>([]);

  React.useEffect(() => {
    const region = {
      latitude: 36.7783,
      longitude: -119.4179,
      latitudeDelta: 0.1,
      longitudeDelta: 0.1,
    };
    MapkitLocalSearch.searchForLocations('Popeyes', region)
      .then((result) => {
        setLocations(result);
      })
      .catch((error) => {
        console.log(error);
      });
  }, []);

  return (
    <View style={styles.container}>
      {locations.map((location) => (
        <Text>{location.title}</Text>
      ))}
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    alignItems: 'center',
    justifyContent: 'center',
  },
});
