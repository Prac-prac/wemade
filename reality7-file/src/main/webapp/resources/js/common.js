const searchEl = document.querySelector('.search');
const searchInputEl = searchEl.querySelector('input');

searchEl.addEventListener('click', function(){
    searchInputEl.focus();
});

//input 요소에 focus되면 searchEl에 focused 클래스 추가
searchInputEl.addEventListener('focus', function(){
    //클래스 추가
    searchEl.classList.add('focused');
    //attribute : HTML속성
    searchInputEl.setAttribute('placeholder', '통합검색');
});

//focus 해제 됐을 때
searchInputEl.addEventListener('blur', function(){
    searchEl.classList.remove('focused');
    searchInputEl.setAttribute('placeholder', '');
});



const thisYear = document.querySelector('.this-year');
thisYear.textContent = new Date().getFullYear();