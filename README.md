# This is a bad idea

I'm trying to figure out a nice pattern for calling a JS function from Elm and returning it (likely asynchronously generated) result to the component that requested it.

A Task seems like the most appropriate method. I still do not yet understand how the incoming Msg is correctly tagged, but it works. The problem as I see it is that custom types of tasks may only be created by writing Native code.

## Instructions

```sh
$ elm-make CounterPair.elm --output build.js
$ open index.html
```

The key points of interest are https://github.com/tgecho/elm-custom-task-example/blob/master/Counter.elm#L40 and https://github.com/tgecho/elm-custom-task-example/blob/master/Native/Number.js
