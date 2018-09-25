---
to: src\components\<%= h.inflection.camelize(name, false) %>.tsx
---
import * as React from "react";

export interface <%= h.inflection.camelize(name, false) %>Props {

}

export interface <%= h.inflection.camelize(name, false) %>State {
  
}

export default class <%= h.inflection.camelize(name, false) %> extends React.Component<<%= h.inflection.camelize(name, false) %>Props, <%= h.inflection.camelize(name, false) %>State>
{
  public state = {

  }
  
  public render() {
    return (
      <div></div>
    )
  }
}
