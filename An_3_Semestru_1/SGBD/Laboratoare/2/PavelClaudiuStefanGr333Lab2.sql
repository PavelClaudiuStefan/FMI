select * from title;
select * from title_copy;
select * from rental;
select * from member;   
select * from reservation;


--Ex 4
--Cate filme (titluri, respectiv copii) au fost imprumutate din cea mai ceruta categorie?
select max(count(category)) as "Numar filme"
from title t
join rental r
  on t.title_id = r.title_id
group by title, category;


--Ex 5
--Cate copii din fiecare film sunt disponibile in prezent (considerati ca statusul unei copii nu este setat, deci nu poate fi utilizat)?
select title, count(*)
from title t
join title_copy c
  on t.title_id = c.title_id
where (c.title_id, c.copy_id) not in (
    select t.title_id, t.copy_id
    from title_copy t join rental r
    on (t.title_id = r.title_id) and (t.copy_id = r.copy_id)
    where act_ret_date is null
)
group by title;


--Ex 6
--Afisati urmatoarele informatii: titlul filmului, numarul copiei, statusul setat si statusul corect
select t.title, c.title_id, c.copy_id, status, NVL2(act_ret_date, 'AVAILABLE', 'RENTED') as status_corect
from title t
join title_copy c
  on t.title_id = c.title_id
join rental r
  on (c.title_id = r.title_id) and (c.copy_id = r.copy_id)
where (r.title_id, r.copy_id, r.book_date) in (
    select title_id, copy_id, max(book_date)
    from rental
    group by title_id, copy_id
)
union
select t.title, c.title_id, c.copy_id, null as status, 'AVAILABLE'
from title t
join title_copy c
  on t.title_id = c.title_id
where (c.title_id, c.copy_id) not in (
    select title_id, copy_id
    from rental
)
order by title_id, copy_id;

--Ex 7
--Cate copii au statusul eronat? Setati statusul corect al acestor copii. Salvati actualizarile realizate.
select count(*)
from (
    select replace(status)
    from (
        select t.title, c.title_id, c.copy_id, status, NVL2(act_ret_date, 'AVAILABLE', 'RENTED') as status_corect
        from title t
        join title_copy c
          on t.title_id = c.title_id
        join rental r
          on (c.title_id = r.title_id) and (c.copy_id = r.copy_id)
        where (r.title_id, r.copy_id, r.book_date) in (
            select title_id, copy_id, max(book_date)
            from rental
            group by title_id, copy_id
        )
        union
        select t.title, c.title_id, c.copy_id, null as status, 'AVAILABLE'
        from title t
        join title_copy c
          on t.title_id = c.title_id
        where (c.title_id, c.copy_id) not in (
            select title_id, copy_id
            from rental
        )
    )
    where (status is null) or (status not like status_corect)
);

--Ex 8
--Toate titlurile rezervate au fost imprumutate la data pentru care au fost rezervate de persoana respectiva? Afisati textul DA sau NU in functie de situatie


-- !!! In reservation spune ca membru 106 a luat cartea 102, dar 102 nu exista in tabelul title
--si daca nu ne putem baza pe res_date ca fiind parte din cheia primara, atunci nu se poate face un join intre rental si reservation
--
select a.member_id, a.title_id, 'DA' as corect
from reservation a
join rental b
  on (a.title_id = b.title_id) and (a.member_id = b.member_id)
where res_date != book_date
union
select a.member_id, a.title_id, 'NU' as corect
from reservation a
join rental b
  on (a.title_id = b.title_id) and (a.member_id = b.member_id)
where res_date != book_date;


--Ex 9
--De cate ori a imprumutat un membru (nume si prenume) fiecare film (titlu)?
select first_name, last_name, title, count(r.title_id)
from member m
join rental r
  on m.member_id = r.member_id
join title t
  on r.title_id = t.title_id
group by first_name, last_name, title;


--Ex 10
--De cate ori a imprumutat un membru (nume si prenume) fiecare copie (cod) a unui film (titlu)?
select first_name, last_name, title, r.copy_id, count(r.title_id)
from member m
join rental r
  on m.member_id = r.member_id
join title t
  on r.title_id = t.title_id
group by first_name, last_name, title, r.copy_id;


--Ex 11
--Obtineti statusul celei mai des imprumutata copii a fiecarui film (titlu).
select distinct status
from title_copy c
join rental r
  on (c.title_id = r.title_id) and (c.copy_id = r.copy_id)
where (c.title_id, c.copy_id) in (
    select r.title_id, r.copy_id
    from rental r
    group by r.title_id, r.copy_id, status
    having count(book_date) in (
        select max(count(book_date))
        from rental r
        group by r.title_id, r.copy_id
    )
);


--Ex 12
--Pentru fiecare zi a lunii curente (toate zilele din luna) obtineti numarul de imprumuturi efectuate
select book_date, count(book_date)
from rental
where book_date = TO_DATE('10/01/2017', 'mm/dd/yyyy')
group by book_date;