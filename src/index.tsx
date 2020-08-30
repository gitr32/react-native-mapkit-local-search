import { NativeModules } from 'react-native';

type MapkitLocalSearchType = {
  multiply(a: number, b: number): Promise<number>;
};

const { MapkitLocalSearch } = NativeModules;

export default MapkitLocalSearch as MapkitLocalSearchType;
