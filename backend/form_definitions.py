from dateutil.parser import parse as dt_parse

class FormDataError(Exception):
    def __init__(self,*args,**kwargs):
        Exception.__init__(self,*args,**kwargs)

class SeekerFormData(object):
    seeker_id = None
    phone_number = None
    gender = None
    birthdate = None
    race_ethnicity = None
    profession = None
    income_level = None
    budget = None
    household_size = None
    adults_cnt = None
    children_cnt = None
    has_pets = None
    photo = None
    current_zip = None
    historical_connection_option_key = None
    barrier_selection_key = None
    regular_community_visitor = None
    regular_community_visitor_reason_key = None


    def _parse_data(self, data):
        cols = data.keys()
        vals = ["'{}'".format(data.get(c)) for c in cols]

        colstr = "(" + ", ".join(cols) + ")"
        valstr = "(" + ", ".join(vals) + ")"

        return colstr, valstr
    

    def __init__(self, seeker_id, data):
        data['seeker_id'] = seeker_id

        columns, values = self._parse_data(data)
        self.columns = columns
        self.values = values
            
    def insert_statement(self):
        qry = """insert into seeker_form_response {} values {}
        """.format(self.columns, self.values)

        return qry
        
