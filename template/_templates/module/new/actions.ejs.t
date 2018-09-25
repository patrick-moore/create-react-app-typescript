---
to: src/<%= name %>/state/actions.ts
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

  addActionCreator = 'add' + singPascal;
  removeActionCreator = 'remove' + singPascal;
  addAction = 'ADD_' + singAllCaps;
  removeAction = 'REMOVE_' + singAllCaps;
  setActionCreator = 'set' + pluralPascal;
  setAction = 'SET_' + pluralAllCaps;
-%>
import { createAsyncAction } from "typesafe-actions";

import { <%= singPascal %> } from "./models";

export const fetch<%= pluralPascal %> = createAsyncAction(
  "FETCH_<%= pluralAllCaps %>_REQUEST",
  "FETCH_<%= pluralAllCaps %>_SUCCESS",
  "FETCH_<%= pluralAllCaps %>_FAILURE"
)<void, <%= singPascal %>[], Error>();

export const add<%= singPascal %> = createAsyncAction(
  "ADD_<%= singAllCaps %>_REQUEST",
  "ADD_<%= singAllCaps %>_SUCCESS",
  "ADD_<%= singAllCaps %>_FAILURE"
)<<%= singPascal %>, <%= singPascal %>, Error>();

export const remove<%= singPascal %> = createAsyncAction(
  "REMOVE_<%= singAllCaps %>_REQUEST",
  "REMOVE_<%= singAllCaps %>_SUCCESS",
  "REMOVE_<%= singAllCaps %>_FAILURE"
)<string, string, Error>();

export const edit<%= singPascal %> = createAsyncAction(
  "EDIT_<%= singAllCaps %>_REQUEST",
  "EDIT_<%= singAllCaps %>_SUCCESS",
  "EDIT_<%= singAllCaps %>_FAILURE"
)<<%= singPascal %>, <%= singPascal %>, Error>();

