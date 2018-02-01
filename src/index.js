import React, { Component } from 'react'

import {
    StyleSheet,
} from 'react-native'

import SplashScreen from './screens/Splash'

export default class extends Component {
    constructor(props) {
        super(props)

        this.state = {
            isSignedIn: false,
            checkedSignIn: false
        }
    }

    render() {
        const { isSignedIn, checkedSignIn } = this.state

        // Display the Splash screen until
        // AsyncStorage promise response back.
        if ( ! checkedSignIn ) {
            return <SplashScreen screenProps={{ ...this.props }} />
        }

        return <SplashScreen screenProps={{ ...this.props }} />
    }
}

const styles = StyleSheet.create({
    container: {
        flex: 1,
    },
    safeArea: {
        backgroundColor: 'transparent'
    },
})