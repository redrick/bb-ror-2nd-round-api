namespace :csv do
  desc 'Import invoices.csv placed in tmp folder'
  task :import => :environment do
    File.open("tmp/invoices.csv", "r") do |f|
      f.each_line do |line|
        next if line.start_with? 'client name,'
        data = line.split(',')
        category_name = data.pop
        category = Category.find_or_create_by(name: category_name)
        client_data = data.first(2)
        client = Client.find_or_create_by(name: client_data.first, company_number: client_data.last)
        invoice_data = data.drop(2)
        Invoice.find_or_create_by(
          number: invoice_data[0],
          price: invoice_data[1],
          vat_rate: invoice_data[2],
          issued_at: invoice_data[3],
          category: category,
          client: client)
      end
    end
  end
end
