String.prototype.rot13 = function() {
  return this.replace(/[a-zA-Z]/g, function(c) {
    return String.fromCharCode((c <= 'Z' ? 90 : 122) >= (c = c.charCodeAt(0) + 13) ? c : c - 26);
  });
}

var Deobfuscator = {
  
  run: function() {
    $$("*[data-obfuscate]").each(Deobfuscator.restore);
  },
  
  restore: function(node) {
    switch(node.readAttribute("data-obfuscate")) {
      case 'email':
        node.update(node.innerHTML.gsub(',', '@').gsub('/', '.').rot13()); break
    }
    node.removeAttribute('data-obfuscate');
  }
  
}

document.on("dom:loaded", function() {
  Deobfuscator.run();
});
