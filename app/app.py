from flask import Flask, request, jsonify
from faker import Faker
from numpy import random
import pandas as pd
import time
from datetime import timedelta, datetime


def _generate_events_each_day(date):
    seed = int(time.mktime(date.timetuple()))
    Faker.seed(seed)
    random_state = random.RandomState(seed)

    n_users = random_state.randint(low=50, high=100)
    n_events = random_state.randint(low=200, high=2000)

    fake = Faker()
    user_ips = [fake.ipv4() for _ in range(n_users)]

    return pd.DataFrame(
        {
            "user": random_state.choice(user_ips, size=n_events, replace=True),
            "date": pd.to_datetime([date] * n_events)
        }
    )

def _generate_events_30_days(end_date):
    list_events = [_generate_events_each_day(date=end_date - timedelta(days=30-i)) for i in range(30)]
    df_events = pd.concat(list_events, axis=0).reset_index(drop=True)
    return df_events


app = Flask(__name__)
app.config['events'] = _generate_events_30_days(end_date=datetime.now().date())


@app.route('/events')
def show_events():
    start_date = _str_to_date(request.args.get("start_date", None))
    end_date = _str_to_date(request.args.get("end_date", None))

    events = app.config.get('events')

    if start_date is not None:
        events = events.loc[events['date'] >= start_date]
    if end_date is not None:
        events = events.loc[events['date'] < end_date]

    return jsonify(events.to_dict(orient='records'))


def _str_to_date(date_str):
    if date_str is None:
        return None
    return datetime.strptime(date_str, "%Y-%m-%d")


if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000, debug=True)