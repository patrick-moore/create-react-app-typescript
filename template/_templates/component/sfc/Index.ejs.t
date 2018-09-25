---
to: src\components\<%= h.inflection.camelize(name, false) %>.tsx
---
import * as React from "react";

export interface <%= h.inflection.camelize(name, false) %>Props {

}

export default function <%= h.inflection.camelize(name, false) %>(props: <%= h.inflection.camelize(name, false) %>Props) {
  return (
    <div></div>
  )
}
