from flask import Flask,request,jsonify
import random

app=Flask(__name__)


@app.route('/getdata',methods=['POST','GET'])
def get_data():
    if request.method=='GET':
        my_list=["Health is Wealth","Money Makes Many Things","Help the needy"]
        rand=random.choice(my_list)
        response={"message":rand}
        return jsonify(response),200
    else:
        return "false",404


if __name__=='__main__':
    app.run('0.0.0.0',port="Your Port",debug=True)