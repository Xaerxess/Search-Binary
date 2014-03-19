use strict;
use warnings;
use Test::More 0.96;

use Search::Binary;
use lib 't/lib';
use Search::Binary::TestUtils qw(make_numeric_array_reader);

sub binary_search_whole_array {
    my ( $array, $value ) = @_;
    return binary_search 0, @{$array} - 1, $value, make_numeric_array_reader($array);
}

subtest 'Basic operations' => sub {
    my $ints = [ 0..9 ];
    is(binary_search_whole_array($ints, -100), 0,
       'binary_search - element less than all elements in array.');
    is(binary_search_whole_array($ints, 100), scalar @{$ints},
       'binary_search - element greater than all elements in array.');
    is(binary_search_whole_array($ints, 3), 3, 'binary_search - element in array.');
    is(binary_search_whole_array($ints, 8), 8, 'binary_search - element in array.');
};

subtest 'Check stable search' => sub {
    my $all_equal = [ ( map { 1 } 0..99 ), ( map { 2 } 0..99 ) ];
    is(binary_search_whole_array($all_equal, 1), 0,
       'binary_search - integer (1) equal to few elements in array.');
    is(binary_search_whole_array($all_equal, 2), 100,
       'binary_search - integer (2) equal to few elements in array.');
};

done_testing();
