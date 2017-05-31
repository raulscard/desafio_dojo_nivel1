Dado(/^que logue no ORANGEHRM$/) do
  
	visit('http://opensource.demo.orangehrmlive.com/')
	fill_in('txtUsername', :with=>'admin')
	fill_in('txtPassword', :with=>'admin')
	click_button('btnLogin')

end

Quando(/^preencho o cadastro do funcionario$/) do
  
	click_link('PIM')
  click_link('menu_pim_addEmployee')
  fill_in('firstName', :with=>'Juca')
  fill_in('middleName', :with=>Faker::Name.first_name)
  fill_in('lastName', :with=>Faker::Name.last_name)
  #fill_in('employeeId', :with=>Faker::Number.number(4))
  find(:xpath, '//*[@id="chkLogin"]').click
  fill_in('user_name', :with=>Faker::Number.hexadecimal(5))
  senha = Faker::Number.hexadecimal(8)
  fill_in('user_password', :with=>senha)
  fill_in('re_password', :with=>senha)
  select('Enabled', :from => 'status')

end

Entao(/^o sistema realiza o cadastro com sucesso$/) do
  
  click_button('btnSave')
  sleep(2)
  assert_text('Juca')

end

Quando(/^seleciono o funcionario$/) do

	click_link('PIM')
	click_link('menu_pim_viewEmployeeList')
	sleep(2)
	fill_in('empsearch_employee_name_empName', :with=>'Juca')
	click_button('searchBtn')
	first(:link, 'Juca').click
	
end

Entao(/^edito as informacoes cadastradas$/) do
  
	click_button('btnSave')
	fill_in('personal_txtOtherID', :with=>Faker::Number.number(4))
	fill_in('personal_txtLicenNo', :with=>Faker::Number.number(11))
	fill_in('personal_txtLicExpDate', :with=>'2018-05-26')
	choose('personal_optGender_1')
	fill_in('personal_DOB', :with=>'2017-07-13')
	click_button('btnSave')

	find(:xpath, '//*[@id="sidenav"]/li[2]/a').click
	click_button('btnSave')
	fill_in('contact_street1', :with=>Faker::Address.street_name)
	fill_in('contact_city', :with=>Faker::Address.city)
	fill_in('contact_province', :with=>Faker::Address.state)
	fill_in('contact_emp_zipcode', :with=>Faker::Address.zip_code)
	click_button('btnSave')

	find(:xpath, '//*[@id="sidenav"]/li[6]/a').click
	click_button('btnSave')
	select('CEO', :from => 'job_job_title')
	select('Full-Time Permanent', :from => 'job_emp_status')
	fill_in('job_joined_date', :with=>'2010-10-10')
	click_button('btnSave')

	click_link('menu_pim_viewEmployeeList')

end