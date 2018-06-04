//= require showdown

const initApplication = function() {
    const hiddenMarkdown = document.getElementById('hiddenMarkdown');
    if (hiddenMarkdown) renderMarkdown(hiddenMarkdown.innerText);

    const textInput = document.querySelector('form #document_content');
    if (textInput) {
        const renderEdit = function() { renderMarkdown(textInput.value); };
        textInput.addEventListener('change', renderEdit);
        textInput.addEventListener('keydown', renderEdit);
        renderEdit();
    }
};

const renderMarkdown = function(markdown) { 
    const converter = new showdown.Converter();
    const displayArea = document.getElementById('displayarea')
    if ( displayArea ) displayArea.innerHTML = converter.makeHtml(markdown);
};

document.addEventListener('turbolinks:load', function() { initApplication() })
