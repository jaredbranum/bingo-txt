$(function(){
  var squares = $('#bingo tr td:not(.popout)').map(function(){
    return ($(this).text());
  });
  var len = squares.length, input, form = $('#to-txt');
  for(var i = 0; i < len; i++){
    input = $('<input />')
      .attr('name', 'items[]')
      .attr('value', squares[i]);
    form.append(input);
  }
  form.submit();
});