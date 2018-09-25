---
to: src/<%= name %>/state/models.ts
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

  stateInterface = pluralPascal + 'State';

-%>

import { Dictionary } from "src/core/types";

export interface <%= stateInterface %> {
  readonly data: Dictionary<<%= singPascal %>>;
  readonly loaded: boolean;
}

export const initialState: <%= stateInterface %> = {
  data: {} as Dictionary<<%= singPascal %>>,
  loaded: false
};

export interface <%= singPascal %> {
  id: string;
}