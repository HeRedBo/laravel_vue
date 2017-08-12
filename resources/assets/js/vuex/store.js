import Vue from 'vue';
import Vuex from 'vuex';
import * as actions from './actions.js';
import * as mutations from './mutations.js';

Vue.use(Vuex);
const state = {
    websocket:Object,
    uid:window.User.id
}

export default new Vuex.Store({
    state,
    actions,
    mutations
});
