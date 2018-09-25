---
to: src/<%= name %>/state/sagas.ts
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
import { put, takeEvery, call, select } from "redux-saga/effects";
import * as actions from "./actions";
import { getType } from "typesafe-actions";

import { StoreState } from "src/store";
import Api from "src/api/RestApi";
import { <%= singPascal %> } from "./models";

const api = new Api<<%= singPascal %>>("/<%= pluralCamel %>");

export function* fetch<%= pluralPascal %>() {
  const previouslyLoaded = yield select(({ <%= pluralCamel %> }: StoreState) => <%= pluralCamel %>.loaded);
  if (!previouslyLoaded) {
    try {
      const data = yield call([api, api.get]);
      yield put(actions.<%= fetchAction %>.success(data.data));
    } catch (error) {
      yield put(actions.<%= fetchAction %>.failure(error));
    }
  }
}

const sagas = [
  takeEvery(getType(actions.fetch<%= pluralPascal %>.request), fetch<%= pluralPascal %>)
];

export default sagas;
