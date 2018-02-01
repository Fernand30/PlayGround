import React, { Component } from 'react'
import {
    TouchableOpacity,
    TouchableHighlight,
    Text,
    Image,
    View
} from 'react-native'

import LinearGradient from 'react-native-linear-gradient'
import styles from './styles'

import * as Animatable from 'react-native-animatable'

export default ({ animated }) => (
    <LinearGradient
        colors={['#46c56d', '#08799a']}
        start={{x: 0.0, y: 0.25}} end={{x: 0.5, y: 1.0}}
        style={styles.wrapper}
    >
        <View style={styles.logoContainer}>
            <Animatable.Text
                animation="bounce"
                delay={1000}
                iterationCount={'infinite'}>
                <Image
                    style={styles.logo}
                    source={require('../../../assets/images/Logo.png')}
                />
            </Animatable.Text>
            <Animatable.Text
                style={styles.title}
                animation="zoomInUp"
            >Safe Stash</Animatable.Text>
        </View>
    </LinearGradient>
)


