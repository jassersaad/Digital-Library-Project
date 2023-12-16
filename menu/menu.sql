
accept selection prompt "Enter option 1-8:1-book_info/2-remove_librarian/3-report_book/4-reserve_book/5-reserve_book/6-view_member/7- remove_member/8-reserved_books"


set term off

column script new_value v_script

select case '&selection.'
       when '1' then accept bid prompt 'please enter book id'
                     execute  pck_library.book_info(&bid)
       when '2' then execute pck_library.p_report
       when '3' then execute pck_library.remove_librarian
       when '4' then execute pck_library.report_book
       when '5' then execute pck_library.reserve_book
       when '6' then execute pck_library.view_member
       when '7' then execute pck_library.remove_member
       when '8' then execute pck_library.reserved_books
       else 'menu'
       end as script
from all_tables;

set term on

@&v_script.