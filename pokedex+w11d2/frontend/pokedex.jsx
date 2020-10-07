import React from 'react';
import ReactDOM from 'react-dom';
import { HashRouter, Route } from 'react-router-dom'
import {receiveAllPokemon, requestAllPokemon} from './actions/pokemon_actions'
import {fetchAllPokemon} from './util/api_util'
import {configureStore} from './store/store'
import {selectAllPokemon} from './reducers/selectors'
import Root from './components/root'

document.addEventListener('DOMContentLoaded', () => {
    const rootEl = document.getElementById('root');
    const store = configureStore();
    ReactDOM.render(<Root store={store}/>, rootEl)
    
    window.getState = store.getState;
    window.dispatch = store.dispatch;
    window.requestAllPokemon = requestAllPokemon
    window.receiveAllPokemon = receiveAllPokemon;
    window.fetchAllPokemon = fetchAllPokemon;
    window.selectAllPokemon = selectAllPokemon
});