use List::MoreUtils qw(uniq);
use strict;
use warnings;
use 5.010;

my $head = "<html>\n <meta http-equiv=\"content-type\" content=\"text/html; charset=utf-8\" />\n<body>\n<table border=\"1\">\n <tr>\n  <th>Artist</th>\n  <th>Album</th>\n  <th>Tracks</th>\n </tr>\n";
print $head;
my @music = <music/*/*/*/*/*>;
my @path = <music/*/*/*/*/*>;
my @artist = ();
my @album = ();
foreach my $music (@music) {
    my ($artist, $album) = (split /\//, $music)[2,3];
    push(@artist, $artist);
    my $al = join '/',$artist, $album;
    push(@album, $al);
}
@artist = uniq @artist;
@artist = sort @artist;
@album = uniq @album;
@album = sort @album;
foreach my $artist (@artist) {
    foreach my $album (@album) {
        print "<td rowspan=\"\"$artist<\/td>\n";
        my $newalbum = (split /\//, $album)[2];
        print $newalbum . "\n";
        foreach my $path (@path) {
            if (index($path, $album) != -1) {
                print "<tr><td><a href=\"$path\">\n";
            }
        }
    }
}
foreach my $artist (@artist) {
    print "<td rowspan=\"\"$artist<\/td>\n";
        foreach my $path (@path) {
            if (index($path, $artist) != -1) {

                print "<tr><td><a href=\"$path\">\n";
            }

        }
}
my $tail = "</table>\n</body>\n";
print $tail;


#if (index($music, $artist) != -1) {
#    print "@artist\n";
#}
#        print " <tr>\n";
#        foreach my $path (@path) {
#            print "<tr><td><a href=\"$path\">\n";
#        }

#        print " </tr>\n";
