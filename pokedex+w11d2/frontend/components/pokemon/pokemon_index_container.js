import { connect } from 'react-redux'
import { requestAllPokemon } from '../../actions/pokemon_actions'
import { selectAllPokemon } from '../../reducers/selectors'
import PokemonIndex from './pokemon_index'

const mapStateToProps = (state) => {
    const pokemon = selectAllPokemon(state)

    return({
        pokemon: pokemon
    })
}

const mapDispatchToProps = (dispatch) => {
    return ({
        requestAllPokemon: () => {
            return dispatch(requestAllPokemon())
        }
    })
}

export default connect(mapStateToProps, mapDispatchToProps)(PokemonIndex)