document.addEventListener('turbolinks:load', function() {
    const control = document.querySelector('.sort-by-title');

    if (control) {
        control.addEventListener('click', sortRowsByTitle);
    }
})

function sortRowsByTitle() {
    let i;
    const table = document.querySelector('table');

    const rows = table.querySelectorAll('tr');
    let sortedRows = [];

    for (i = 1; i < rows.length; i++) {
        sortedRows.push(rows[i]);
    }


    if (this.querySelector('.octicon-arrow-up').classList.contains('hide')) {
        sortedRows.sort(compareRowsAsc);
        this.querySelector('.octicon-arrow-up').classList.remove('hide');
        this.querySelector('.octicon-arrow-down').classList.add('hide');
    } else {
        sortedRows.sort(compareRowsDesc);
        this.querySelector('.octicon-arrow-down').classList.remove('hide');
        this.querySelector('.octicon-arrow-up').classList.add('hide');
    }

    const sortedTable = document.createElement('table');
    sortedTable.classList.add('table');
    sortedTable.appendChild(rows[0]);

    for (i = 0; i < sortedRows.length; i++) {
        sortedTable.appendChild(sortedRows[i]);
    }

    table.parentNode.replaceChild(sortedTable, table);
}

function compareRowsAsc(row1, row2) { // особенность sort, нужно вернуть 0,1,-1 https://developer.mozilla.org/ru/docs/Web/JavaScript/Reference/Global_Objects/Array/sort
    const firstTitle = row1.querySelector('td').textContent;
    const secondTitle = row2.querySelector('td').textContent;

    if (firstTitle < secondTitle) {
        return -1;
    }
    if (firstTitle > secondTitle) {
        return 1;
    }
    return 0;
}

function compareRowsDesc(row1, row2) {
    const firstTitle = row1.querySelector('td').textContent;
    const secondTitle = row2.querySelector('td').textContent;

    if (firstTitle < secondTitle) {
        return 1;
    }
    if (firstTitle > secondTitle) {
        return -1;
    }
    return 0;
}