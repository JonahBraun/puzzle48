-- Optimized for simplicity and speed

.mode list
.separator ' '
.timer on

create table p(pid integer, top varchar(1), rht varchar(1), btm varchar(1), lft varchar(1));

insert into p (pid, top, rht, btm, lft)
	select 1 as pid, '⬣' as top, '+' as rht, '+' as btm, '⬣' as lft
	union select 2, '⊻', '⊻', '+', '⬣'
	union select 3, '∧', '∧', '⬣', '⊻'
	union select 4, '⊻', '+', '∧', '⊻'

	union select 5, '∧', '+', '⬣', '∧'
	union select 6, '⊻', '⬣', '∧', '⊻'
	union select 7, '+', '∧', '+', '⊻'
	union select 8, '∧', '⬣', '⬣', '+'

	union select 9, '⊻', '⊻', '+', '∧'
	union select 10, '+', '⬣', '∧', '∧'
	union select 11, '⬣', '⊻', '⬣', '+'
	union select 12, '⊻', '∧', '∧', '⬣'

	union select 13, '∧', '⬣', '⬣', '∧'
	union select 14, '+', '⬣', '⬣', '⊻'
	union select 15, '⬣', '⬣', '⬣', '∧'
	union select 16, '⊻', '⬣', '⊻', '+'

	-- Same 16 pieces but flipped diagonally
	union select 1, '+', '⬣', '⬣', '+'
	union select 2, '⊻', '⊻', '⬣', '+'
	union select 3, '∧', '∧', '⊻', '⬣'
	union select 4, '+', '⊻', '⊻', '∧'

	union select 5, '+', '∧', '∧', '⬣'
	union select 6, '⬣', '⊻', '⊻', '∧'
	union select 7, '∧', '+', '⊻', '+'
	union select 8, '⬣', '∧', '+', '⬣'

	union select 9, '⊻', '⊻', '∧', '+'
	union select 10, '⬣', '+', '∧', '∧'
	union select 11, '⊻', '⬣', '+', '⬣'
	union select 12, '∧', '⊻', '⬣', '∧'

	union select 13, '⬣', '∧', '∧', '⬣'
	union select 14, '⬣', '+', '⊻', '⬣'
	union select 15, '⬣', '⬣', '∧', '⬣'
	union select 16, '⬣', '⊻', '+', '⊻'
;

analyze p;

select count(*) from
	p as a1, p as a2, p as a3, p as a4,
	p as b1, p as b2, p as b3, p as b4,
	p as c1, p as c2, p as c3, p as c4,
	p as d1, p as d2, p as d3, p as d4

	where a1.rht=a2.lft and a1.btm=b1.top
		and a2.rht=a3.lft and a2.btm=b2.top
		and a3.rht=a4.lft and a3.btm=b3.top
											and a4.btm=b4.top

		and b1.rht=b2.lft and b1.btm=c1.top
		and b2.rht=b3.lft and b2.btm=c2.top
		and b3.rht=b4.lft and b3.btm=c3.top
											and b4.btm=c4.top

		and c1.rht=c2.lft and c1.btm=d1.top
		and c2.rht=c3.lft and c2.btm=d2.top
		and c3.rht=c4.lft and c3.btm=d3.top
											and c4.btm=d4.top

		and d1.rht=d2.lft
		and d2.rht=d3.lft
		and d3.rht=d4.lft

	and a1.pid!=a2.pid and a1.pid!=a3.pid and a1.pid!=a4.pid and a1.pid!=b1.pid and a1.pid!=b2.pid and a1.pid!=b3.pid and a1.pid!=b4.pid and a1.pid!=c1.pid and a1.pid!=c2.pid and a1.pid!=c3.pid and a1.pid!=c4.pid and a1.pid!=d1.pid and a1.pid!=d2.pid and a1.pid!=d3.pid and a1.pid!=d4.pid 
	and a2.pid!=a1.pid and a2.pid!=a3.pid and a2.pid!=a4.pid and a2.pid!=b1.pid and a2.pid!=b2.pid and a2.pid!=b3.pid and a2.pid!=b4.pid and a2.pid!=c1.pid and a2.pid!=c2.pid and a2.pid!=c3.pid and a2.pid!=c4.pid and a2.pid!=d1.pid and a2.pid!=d2.pid and a2.pid!=d3.pid and a2.pid!=d4.pid 
	and a3.pid!=a1.pid and a3.pid!=a2.pid and a3.pid!=a4.pid and a3.pid!=b1.pid and a3.pid!=b2.pid and a3.pid!=b3.pid and a3.pid!=b4.pid and a3.pid!=c1.pid and a3.pid!=c2.pid and a3.pid!=c3.pid and a3.pid!=c4.pid and a3.pid!=d1.pid and a3.pid!=d2.pid and a3.pid!=d3.pid and a3.pid!=d4.pid 
	and a4.pid!=a1.pid and a4.pid!=a2.pid and a4.pid!=a3.pid and a4.pid!=b1.pid and a4.pid!=b2.pid and a4.pid!=b3.pid and a4.pid!=b4.pid and a4.pid!=c1.pid and a4.pid!=c2.pid and a4.pid!=c3.pid and a4.pid!=c4.pid and a4.pid!=d1.pid and a4.pid!=d2.pid and a4.pid!=d3.pid and a4.pid!=d4.pid 
	and b1.pid!=a1.pid and b1.pid!=a2.pid and b1.pid!=a3.pid and b1.pid!=a4.pid and b1.pid!=b2.pid and b1.pid!=b3.pid and b1.pid!=b4.pid and b1.pid!=c1.pid and b1.pid!=c2.pid and b1.pid!=c3.pid and b1.pid!=c4.pid and b1.pid!=d1.pid and b1.pid!=d2.pid and b1.pid!=d3.pid and b1.pid!=d4.pid 
	and b2.pid!=a1.pid and b2.pid!=a2.pid and b2.pid!=a3.pid and b2.pid!=a4.pid and b2.pid!=b1.pid and b2.pid!=b3.pid and b2.pid!=b4.pid and b2.pid!=c1.pid and b2.pid!=c2.pid and b2.pid!=c3.pid and b2.pid!=c4.pid and b2.pid!=d1.pid and b2.pid!=d2.pid and b2.pid!=d3.pid and b2.pid!=d4.pid 
	and b3.pid!=a1.pid and b3.pid!=a2.pid and b3.pid!=a3.pid and b3.pid!=a4.pid and b3.pid!=b1.pid and b3.pid!=b2.pid and b3.pid!=b4.pid and b3.pid!=c1.pid and b3.pid!=c2.pid and b3.pid!=c3.pid and b3.pid!=c4.pid and b3.pid!=d1.pid and b3.pid!=d2.pid and b3.pid!=d3.pid and b3.pid!=d4.pid 
	and b4.pid!=a1.pid and b4.pid!=a2.pid and b4.pid!=a3.pid and b4.pid!=a4.pid and b4.pid!=b1.pid and b4.pid!=b2.pid and b4.pid!=b3.pid and b4.pid!=c1.pid and b4.pid!=c2.pid and b4.pid!=c3.pid and b4.pid!=c4.pid and b4.pid!=d1.pid and b4.pid!=d2.pid and b4.pid!=d3.pid and b4.pid!=d4.pid 
	and c1.pid!=a1.pid and c1.pid!=a2.pid and c1.pid!=a3.pid and c1.pid!=a4.pid and c1.pid!=b1.pid and c1.pid!=b2.pid and c1.pid!=b3.pid and c1.pid!=b4.pid and c1.pid!=c2.pid and c1.pid!=c3.pid and c1.pid!=c4.pid and c1.pid!=d1.pid and c1.pid!=d2.pid and c1.pid!=d3.pid and c1.pid!=d4.pid 
	and c2.pid!=a1.pid and c2.pid!=a2.pid and c2.pid!=a3.pid and c2.pid!=a4.pid and c2.pid!=b1.pid and c2.pid!=b2.pid and c2.pid!=b3.pid and c2.pid!=b4.pid and c2.pid!=c1.pid and c2.pid!=c3.pid and c2.pid!=c4.pid and c2.pid!=d1.pid and c2.pid!=d2.pid and c2.pid!=d3.pid and c2.pid!=d4.pid 
	and c3.pid!=a1.pid and c3.pid!=a2.pid and c3.pid!=a3.pid and c3.pid!=a4.pid and c3.pid!=b1.pid and c3.pid!=b2.pid and c3.pid!=b3.pid and c3.pid!=b4.pid and c3.pid!=c1.pid and c3.pid!=c2.pid and c3.pid!=c4.pid and c3.pid!=d1.pid and c3.pid!=d2.pid and c3.pid!=d3.pid and c3.pid!=d4.pid 
	and c4.pid!=a1.pid and c4.pid!=a2.pid and c4.pid!=a3.pid and c4.pid!=a4.pid and c4.pid!=b1.pid and c4.pid!=b2.pid and c4.pid!=b3.pid and c4.pid!=b4.pid and c4.pid!=c1.pid and c4.pid!=c2.pid and c4.pid!=c3.pid and c4.pid!=d1.pid and c4.pid!=d2.pid and c4.pid!=d3.pid and c4.pid!=d4.pid 
	and d1.pid!=a1.pid and d1.pid!=a2.pid and d1.pid!=a3.pid and d1.pid!=a4.pid and d1.pid!=b1.pid and d1.pid!=b2.pid and d1.pid!=b3.pid and d1.pid!=b4.pid and d1.pid!=c1.pid and d1.pid!=c2.pid and d1.pid!=c3.pid and d1.pid!=c4.pid and d1.pid!=d2.pid and d1.pid!=d3.pid and d1.pid!=d4.pid 
	and d2.pid!=a1.pid and d2.pid!=a2.pid and d2.pid!=a3.pid and d2.pid!=a4.pid and d2.pid!=b1.pid and d2.pid!=b2.pid and d2.pid!=b3.pid and d2.pid!=b4.pid and d2.pid!=c1.pid and d2.pid!=c2.pid and d2.pid!=c3.pid and d2.pid!=c4.pid and d2.pid!=d1.pid and d2.pid!=d3.pid and d2.pid!=d4.pid 
	and d3.pid!=a1.pid and d3.pid!=a2.pid and d3.pid!=a3.pid and d3.pid!=a4.pid and d3.pid!=b1.pid and d3.pid!=b2.pid and d3.pid!=b3.pid and d3.pid!=b4.pid and d3.pid!=c1.pid and d3.pid!=c2.pid and d3.pid!=c3.pid and d3.pid!=c4.pid and d3.pid!=d1.pid and d3.pid!=d2.pid and d3.pid!=d4.pid 
	and d4.pid!=a1.pid and d4.pid!=a2.pid and d4.pid!=a3.pid and d4.pid!=a4.pid and d4.pid!=b1.pid and d4.pid!=b2.pid and d4.pid!=b3.pid and d4.pid!=b4.pid and d4.pid!=c1.pid and d4.pid!=c2.pid and d4.pid!=c3.pid and d4.pid!=c4.pid and d4.pid!=d1.pid and d4.pid!=d2.pid and d4.pid!=d3.pid
;
