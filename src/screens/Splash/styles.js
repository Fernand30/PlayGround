import { StyleSheet } from 'react-native'

export default StyleSheet.create({
  wrapper: {
    flex: 1,
    backgroundColor: '#108096',
    justifyContent: 'center',
    alignItems: 'center',
  },
  backgroundImage: {
    flex: 1,
    alignSelf: 'stretch',
    width: null,
    justifyContent: 'center'
  },
  logoContainer: {
    alignItems: 'center',
    flexGrow: 1,
    justifyContent: 'center'
  },
  logo: {
    width: 100,
    height: 100,
  },
  title: {
    color: '#FFF',
    marginTop: 10,
    fontSize: 22,
    textAlign: 'center',
    backgroundColor: 'transparent',
    fontFamily: 'Lato-Regular'
  },
})