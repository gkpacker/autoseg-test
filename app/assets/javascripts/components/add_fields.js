$(document).on('turbolinks:load', function() {
  $('form').on('click', '.remove-task', function(event) {
    event.preventDefault();
    $(this).prev('input[type=hidden]').val('1');
    $(this).parent().remove();
  });

  $('form').on('click', '.add_fields', function(event) {
    var regexp, time;
    time = new Date().getTime();
    regexp = new RegExp($(this).data('id'), 'g');
    $('.fields').append($(this).data('fields').replace(regexp, time));
    return event.preventDefault();
  });
});

// document.addEventListener('turbolinks:load', () => {
//   if (document.querySelector('form')) {
//     console.log('a')
//     const form = document.querySelector('form')
//     const fields = document.querySelector('.fields')
//     const add_fields = document.querySelector('.add_fields')
//     const remove_buttons = document.querySelectorAll('.remove-task')

//     add_fields.addEventListener('click', (event) => {
//       event.preventDefault();
//       const time = new Date().getTime();
//       const regexp = new RegExp(add_fields.dataset.id, 'g');
//       fields.insertAdjacentHTML('beforeend', add_fields.dataset.fields.replace(regexp, time))
//     });

//     remove_buttons.forEach((task_to_remove) => {
//       task_to_remove.addEventListener('click', (event => {
//         event.preventDefault();
//         console.log('test')
//         event.target.parentNode.querySelector('input[type=hidden]').value = '1'
//         event.target.parentNode.remove();
//       }))
//     })
//   }
// });
