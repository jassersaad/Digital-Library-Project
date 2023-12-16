Accept rn prompt 'please enter reservation number';
Accept mid prompt 'please enter member id';
Accept bod prompt 'please enter book number';

execute pck_library.reserve_book(&rn,&mid,&bod);