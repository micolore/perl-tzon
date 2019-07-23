#!/usr/bin/perl -w

use strict;
use Spreadsheet::ParseExcel;
use Spreadsheet::ParseExcel::FmtUnicode;
#
my $parser   = Spreadsheet::ParseExcel->new();
my $formatter = Spreadsheet::ParseExcel::FmtUnicode->new(Unicode_Map=>"CP936");  #修正中文乱码问题
my $workbook = $parser->parse("/application/file/person&dept.xlsx", $formatter);    
 
 if ( !defined $workbook ) {
     die $parser->error(), ".\n";
   }
      
      for my $worksheet ( $workbook->worksheets() ) {            #遍历sheet
       
           my ( $row_min, $row_max ) = $worksheet->row_range();
               my ( $col_min, $col_max ) = $worksheet->col_range();
                
                    for my $row ( $row_min .. $row_max ) {                 #遍历行列
                            for my $col ( $col_min .. $col_max ) {
                             
                                 my $cell = $worksheet->get_cell( $row, $col );
                                 next unless $cell;
                                                      
                                 print "Row, Col    = ($row, $col)\n";
                                 print "Value       = ", $cell->value(),       "\n";  #读取单元格中的信息
                                 print "\n";
                       }
              }
            print "\nA sheet has been read.\n\n";
         }
