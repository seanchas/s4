var Mx = {};

Mx.SortableTable = Class.create({
  
  initialize: function(table) {
    this.table = $(table);
    
    this.direction = 1;
    
    this.setup();
    this.start();
  },
  
  setup: function() {
    this.head   = this.table.down('thead');
    this.body   = this.table.down('tbody');
    this.rows   = this.body.select('tr');
    this.links  = this.head.select('span');
  },
  
  start: function() {
    this.bound_on_click = this.bound_on_click || this.on_click.bind(this);
    this.head.on('click', 'span', this.bound_on_click);
  },
  
  sort: function() {
    this.rows = this.rows.sort(function(a, b) {
      var av = a.select('td')[this.column].innerHTML.strip();
      var bv = b.select('td')[this.column].innerHTML.strip();
      return (av == bv ? 0 : av > bv ? 1 : -1) * this.direction;
    }.bind(this));

    this.body.update();

    this.rows.each(function(row, index) {
      row.removeClassName('odd');
      row.removeClassName('even');
      row.addClassName(['odd', 'even'][index % 2])
      this.body.insert(row);
    }.bind(this))
  },
  
  on_click: function(e, link) {
    var column = this.links.indexOf(link);
    this.direction = this.column == column ? this.direction * -1 : 1;
    this.column = column;
    this.sort();
  }
  
});

document.on("dom:loaded", function() { $$('table.sortable').each(function(table) { new Mx.SortableTable(table); }); });
