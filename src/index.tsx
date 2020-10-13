import { NativeModules } from 'react-native';

export interface Region {
  latitude: number;
  longitude: number;
  latitudeDelta: number;
  longitudeDelta: number;
}

export interface Location {
  name: string;
  title: string;
  longitude: number;
  latitude: number;
  isoCountryCode: string;
  country: string;
}

type MapkitLocalSearchType = {
  searchForLocations(searchText: string, region: Region): Promise<Location[]>;
};

const { MapkitLocalSearch } = NativeModules;

export default MapkitLocalSearch as MapkitLocalSearchType;
