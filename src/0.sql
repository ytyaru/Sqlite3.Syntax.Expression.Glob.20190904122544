.echo on
-- 任意の１文字
select '1A' glob '?A';
select '1a' glob '?A';
select '11A' glob '?A';

-- 任意の0文字以上
select 'A' glob '*A';
select '1A' glob '*A';
select '11A' glob '*A';
select '11A1' glob '*A';
select 'abc123' glob 'abc*';
select '123abc' glob '*abc';
select '123abc456' glob '*abc*';
select (',' || 'abc' || ',') glob '*,abc,*';

-- メタ文字のエスケープ
select 'A?B' glob 'A[?]B';
select 'A!B' glob 'A[?]B';
select 'A?B' glob 'A?B';
select 'A!B' glob 'A?B';
select 'A123B' glob 'A?B';
select 'A*B' glob 'A[*]B';
select 'A-B' glob 'A[*]B';
select 'A*B' glob 'A*B';
select 'A-B' glob 'A*B';
select 'A123B' glob 'A*B';
select 'A[?]B' glob 'A[?]B';
select 'A[?]B' glob 'A[[?]]B';
select 'A[?]B' glob 'A\[?]\B';

-- 大文字・小文字の区別
select '1a' glob '?A';
select '1A' glob '?A';
select '1a' collate nocase glob '?A';
select '1a' glob '?A' collate nocase;
select '1a' collate nocase glob '?A' collate nocase;
PRAGMA case_sensitive_like = false;
select '1a' glob '?A';
PRAGMA case_sensitive_glob = false;
select '1a' glob '?A';
select '1a' glob '?[a-zA-Z]';

