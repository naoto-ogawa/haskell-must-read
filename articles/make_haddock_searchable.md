
# Add a search functionality on haddock

### Find haddock-util.js
For example
```
.cabal-sandbox/share/doc/x86_64-osx-ghc-8.0.1/haddock-util.js
```
### Find pageLoad function at the end of haddock-util.js.
```javascript
function pageLoad() {
  addStyleMenu();
  adjustForFrames();
  resetStyle();
  restoreCollapsed();
}
```
### Add ```addSearch()``` in the ```pageLoad``` function.
```javascript
function pageLoad() {
  addStyleMenu();
  adjustForFrames();
  resetStyle();
  restoreCollapsed();
  addSearch(); // heare
}
```
### Copy and Paste the following code below the ```pageLoad``` function

```javascript
function addSearch() {
  var m = document.getElementById('module-list');
  var inp = document.createElement("input");
  inp.setAttribute("id", "searchtext");
  inp.setAttribute("type", "text");
  inp.setAttribute("value", "");
  inp.setAttribute("onkeydown", "search();");
  m.insertBefore(inp, m.firstChild);
}

function search(e){
  var inp = document.getElementById("searchtext");
  var re = new RegExp(inp.value);
  list = document.getElementsByTagName('a');
  for(var i=0; i < list.length; i++){
    var e = list.item(i);
    e.parentElement.style.display = re.test(e.text) ? 'block' : 'none';
  }
}
```
### Open frames page
```
open /yourpath/.cabal-sandbox/share/doc/x86_64-osx-ghc-8.0.1/frames.html
```
