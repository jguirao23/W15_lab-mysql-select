-- CHALLENGE 1
select
	authors.au_id as 'AUTHOR ID',
	authors.au_lname as 'LAST NAME',
	authors.au_fname as 'FIRST NAME',
	titles.title as 'TITLE',
    publishers.pub_name as 'PUBLISHER'
from authors
join titleauthor using (au_id)
join titles using (title_id)
join publishers using (pub_id)
order by authors.au_id asc;

-- CHALLENGE 2
select
	authors.au_id as 'AUTHOR ID',
	authors.au_lname as 'LAST NAME',
	authors.au_fname as 'FIRST NAME',
    publishers.pub_name as 'PUBLISHER',
    COUNT(titles.title) as 'TITLE COUNT'
from authors
join titleauthor using (au_id)
join titles using (title_id)
join publishers using (pub_id)
group by authors.au_id, authors.au_lname, authors.au_fname, publishers.pub_name
order by authors.au_id desc;

-- CHALLENGE 3
select
	authors.au_id as 'AUTHOR ID',
	authors.au_lname as 'LAST NAME',
	authors.au_fname as 'FIRST NAME',
    SUM(sales.qty) as 'TOTAL'
from authors
join titleauthor using (au_id)
join titles using (title_id)
join sales using (title_id)
group by authors.au_id, authors.au_lname, authors.au_fname
order by SUM(sales.qty) desc
limit 3;

-- CHALLENGE 4
select
	authors.au_id as 'AUTHOR ID',
	authors.au_lname as 'LAST NAME',
	authors.au_fname as 'FIRST NAME',
    ifnull(SUM(sales.qty),0) as 'TOTAL'
from authors
left join titleauthor using (au_id)
left join titles using (title_id)
left join sales using (title_id)
group by authors.au_id, authors.au_lname, authors.au_fname
order by SUM(sales.qty) desc;



