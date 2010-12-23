var Deobfuscator = {
  
  run: function() {
    $$("*[data-obfuscate]").each(Deobfuscator.restore);
  },
  
  restore: function(node) {
    switch(node.readAttribute("data-obfuscate")) {
      case 'email':
        node.update(node.innerHTML.gsub('+', '@').gsub('/', '.')); break
    }
    node.removeAttribute('data-obfuscate');
  }
  
}

document.on("dom:loaded", function() {
  Deobfuscator.run();
});
