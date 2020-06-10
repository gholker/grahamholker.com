+++
date = "2020-06-09"
title = "Find All XML Tags from the CLI"

+++

These bash one liners served me well when exploring raw HTML and XML. Once building an ingestion / cleaning pipeline I would output more detailed statistics about tag usage.

### HTML

For HTML, you may want to use a looser regex like this one. The regex is searching for anything starting with `<`. It allows the tag to not to be closed.

```
ag "</?([^> ]*)?>?" path/to/html/ -io \
    | sed -n -e 's/^.*:<?\/?//p' \
    | sort --unique
```

### XML

For XML, finding the end tags (e.g. `</EndTag>`) may be sufficient. I didn't consider start tags they can have attributes (e.g. `<StartTag Attribute=X>`). This assumes the XML is already decently formatted. 

```
ag  "</.*?>" path/to/xml/ -oi \
    | sed -n -e 's/^.*://p' \
    | sort --unique
```


Notes:

- `ag` is [the silver searcher](https://github.com/ggreer/the_silver_searcher)

- sed is removing the line number from the result. (e.g. ag returns `123:<br />`)

- `sort --unique` sorts the lines and with the `--unique` option discards the duplicates

