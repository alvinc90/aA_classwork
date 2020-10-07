import React from 'react';
import PokemonIndexContainer from './pokemon_index_container'

class PokemonIndexItem extends React.Component {
    constructor(props) {
        super(props)
    }

    render() {
        return (
            <li key={pokemon.id}>
                <h1>{pokemon.name}</h1>
                <img src={pokemon.image_url} />
            </li>
        )
    }
}

export default PokemonIndexItem;