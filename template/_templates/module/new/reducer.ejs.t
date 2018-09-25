---
to: src/<%= name %>/state/reducer.ts
---
<%
  singPascal = h.inflection.singularize(h.capitalize(name));
  singAllCaps = singPascal.toUpperCase();
  singAllLower = singPascal.toLowerCase();
  singCamel = h.inflection.camelize(singPascal, true);
  pluralPascal = h.inflection.pluralize(singPascal);
  pluralAllCaps = pluralPascal.toUpperCase();
  pluralAllLower = pluralPascal.toLowerCase();
  pluralCamel = h.inflection.camelize(pluralPascal, true);

  actionTypes = singCamel + 'Actions';
  actionType = singPascal + 'Action';
  addAction = 'add' + singPascal;
  removeAction = 'remove' + singPascal;
  fetchAction = 'fetch' + pluralPascal;
-%>
import { ActionType, getType } from "typesafe-actions";

import * as <%= actionTypes %> from "./actions";
import { initialState } from "./models";
import { arrayToObject } from "src/core/array";

export type <%= actionType %> = ActionType<typeof <%= actionTypes %>>;

export default (state = initialState, action: <%= actionType %>) => {
  switch (action.type) {
    case getType(<%= actionTypes %>.<%= addAction %>.success):
      return {
        ...state,
        data: {
          ...state.data,
          [action.payload.id]: action.payload
        }
      };
    case getType(<%= actionTypes %>.<%= removeAction %>.success):
      const { [action.payload]: removed, ...data } = { ...state.data };
      return {
        ...state,
        data
      };
    case getType(<%= actionTypes %>.<%= fetchAction %>.success):
      return {
        ...state,
        data: arrayToObject(action.payload),
        loaded: true
      };
    case getType(<%= actionTypes %>.<%= fetchAction %>.failure):
      return {
        ...state,
        data: {},
        loaded: true
      };
    default:
      return state;
  }
};