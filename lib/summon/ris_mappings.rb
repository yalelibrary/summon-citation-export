#These are the mappings from which
#refworks will draw its tags. On the left is the refworks tag
#on the right an expression which will yield that value given
#a summon document.

#This is an exhaustive list of refworks fields according to:
#http://www.refworks.com/rwathens/help/RefWorks_Tagged_Format.htm
#so some mappings are inevitably going to be blank.

{
  'TY  -': ->() { content_type_to_ris_type }, #Reference Type temp use this as the function name
  'AU  -': ->() { authors.map(&:name) + corporate_authors.map(&:name) }, #Primary Authors
  'A2  -': blank, #Secondary Authors
  'A3  -': blank, #Tertiary Authors
  'A4  -': blank, #Quaternary Authors
  'AB  -': ->() {  abstract }, #Abstract
  'AD  -': blank, #Author Address
  'AN  -': blank, #Accession Number
  'CN  -': blank, #Call Number
  'CY  -': ->() { publication_place }, #Place Published
  'DB  -': ->() { database_title }, #database name
  'DO  -': ->() { doi }, #Digital Object Identifier
  'DP  -': blank, #Database Provider
  'EP  -': ->() { end_page }, #Endpage
  'ET  -': blank, #Edition
  'IS  -': ->() { issue }, #series volume
  'JF  -': ->() { publication_title }, #Periodical Full
  'J2  -': blank, #alternate title
  'KW  -': ->() { subject_terms.tag_per_value }, #keywork
  'L1  -': blank, #file attachments
  'L4  -': blank, #figure
  'LA  -': ->() { languages }, #Language
  'LB  -': blank, #label
  'M1  -': blank, #number 
  'M3  -': ->() { content_type }, #type of work
  'N1  -': blank, #Notes
  'NV  -': blank, #number of volumes
  'OP  -': ->() { publication_place }, #original Publication
  'PB  -': ->() { publisher }, #Publisher
  'PY  -': ->() { publication_date.year.to_s }, #Publication Year
  'RN  -': blank, #research notes
  'SE  -': blank, #chapter
  'SN  -': ->() { issns.empty? ? isbns : issns }, #ISSN/ISBN
  'SP  -': ->() { start_page }, #Start Page
  'T1  -': ->() { subtitle ? "#{title}: #{subtitle}" : title}, #Primary Title
  'T2  -': blank, #secondary title
  'T3  -': blank ,#tertiary title
  'TT  -': blank, #translate title
  'TA  -': blank, #translate author
  'U5  -': ->() { open_url }, #openURL (user-custom field)
  'UR  -': ->() { link ? link : uri }, #if no URI provided, use link we're given
  'VL  -': ->() { volume }, #Volume
  'ER  -': blank, #end
}
