import React, { Component } from 'react';
import {connect} from 'react-redux';
import Aux from '../Aux/Aux';
import Toolbar from '../../components/Navigation/Toolbar/Toolbar';
import classes from './Layout.css';

class Layout extends Component {
    render () {
        return (
            <Aux>
                <Toolbar isAuthenticated={this.props.isAuthenticated} userID={this.props.userID} />
                <main className={classes.Content}>
                    {this.props.children}
                </main>
            </Aux>
        )
    }
}

const mapStateToProps = (state) => {
    return {
        isAuthenticated: state.auth.token != null,
        userID: localStorage.getItem("user_id")
    }
}

export default connect(mapStateToProps, null)(Layout);;