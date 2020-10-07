import React from 'react';
import PokemonIndexItem from './pokemon_index_item'

class PokemonIndex extends React.Component {
    constructor(props) {
        super(props); 
    }

    componentDidMount() {
        this.props.requestAllPokemon();
    }

    render() {
        // debugger
        const PokemonItems = this.props.pokemon.map((pokemon) => {
            return <PokemonIndexItem key={pokemon.id} pokemon={pokemon} />
        });
        return (
            <section className="pokedex">
                <ul>
                    {PokemonItems}
                </ul>
            </section>
        )
    }
}

export default PokemonIndex; 