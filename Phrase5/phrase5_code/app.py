from flask import Flask, render_template, request, redirect
import psycopg2

app = Flask(__name__)


def get_db_connection():
    return psycopg2.connect(
        host='localhost',
        port=5432,
        user='myuser',
        password='mypassword',
        dbname='mydatabase'
    )


@app.route('/')
def index():
    return render_template('index.html')


@app.route('/workers')
def workers():
    conn = get_db_connection()
    cur = conn.cursor()
    cur.execute('SELECT * FROM worker')
    workers = cur.fetchall()
    cur.close()
    conn.close()
    return render_template('worker.html', workers=workers)


@app.route('/add_worker', methods=['POST'])
def add_worker():
    worker_id = request.form['worker_id']
    w_name = request.form['w_name']
    year = request.form['year']
    role = request.form['role']
    conn = get_db_connection()
    cur = conn.cursor()
    cur.execute('INSERT INTO worker VALUES (%s, %s, %s, %s)', (worker_id, w_name, year, role))
    conn.commit()
    cur.close()
    conn.close()
    return redirect('/workers')


@app.route('/edit_worker/<int:worker_id>')
def edit_worker(worker_id):
    conn = get_db_connection()
    cur = conn.cursor()
    cur.execute('SELECT * FROM worker WHERE worker_id = %s', (worker_id,))
    worker = cur.fetchone()
    cur.close()
    conn.close()
    return render_template('edit_worker.html', worker=worker)


@app.route('/update_worker/<int:worker_id>', methods=['POST'])
def update_worker(worker_id):
    w_name = request.form['w_name']
    year = request.form['year']
    role = request.form['role']
    conn = get_db_connection()
    cur = conn.cursor()
    cur.execute('UPDATE worker SET w_name=%s, Year_of_starting_work=%s, role=%s WHERE worker_id=%s',
                (w_name, year, role, worker_id))
    conn.commit()
    cur.close()
    conn.close()
    return redirect('/workers')


@app.route('/delete_worker/<int:worker_id>')
def delete_worker(worker_id):
    conn = get_db_connection()
    cur = conn.cursor()
    cur.execute('DELETE FROM worker WHERE worker_id = %s', (worker_id,))
    conn.commit()
    cur.close()
    conn.close()
    return redirect('/workers')


@app.route('/harvests')
def harvests():
    conn = get_db_connection()
    cur = conn.cursor()
    cur.execute('SELECT * FROM harvest')
    harvests = cur.fetchall()
    cur.close()
    conn.close()
    return render_template('harvest.html', harvests=harvests)


@app.route('/add_harvest', methods=['POST'])
def add_harvest():
    harvest_id = request.form['harvest_id']
    harvest_date = request.form['harvest_date']
    quantity = request.form['quantity']
    inventory_id = request.form['inventory_id']
    conn = get_db_connection()
    cur = conn.cursor()
    cur.execute('INSERT INTO harvest VALUES (%s, %s, %s, %s)', (harvest_id, harvest_date, quantity, inventory_id))
    conn.commit()
    cur.close()
    conn.close()
    return redirect('/harvests')


@app.route('/edit_harvest/<int:harvest_id>')
def edit_harvest(harvest_id):
    conn = get_db_connection()
    cur = conn.cursor()
    cur.execute('SELECT * FROM harvest WHERE harvest_id = %s', (harvest_id,))
    harvest = cur.fetchone()
    cur.close()
    conn.close()
    return render_template('edit_harvest.html', harvest=harvest)


@app.route('/update_harvest/<int:harvest_id>', methods=['POST'])
def update_harvest(harvest_id):
    harvest_date = request.form['harvest_date']
    quantity = request.form['quantity']
    inventory_id = request.form['inventory_id']
    conn = get_db_connection()
    cur = conn.cursor()
    cur.execute('UPDATE harvest SET harvest_date=%s, quantity=%s, inventory_id=%s WHERE harvest_id=%s',
                (harvest_date, quantity, inventory_id, harvest_id))
    conn.commit()
    cur.close()
    conn.close()
    return redirect('/harvests')


@app.route('/delete_harvest/<int:harvest_id>')
def delete_harvest(harvest_id):
    conn = get_db_connection()
    cur = conn.cursor()
    cur.execute('DELETE FROM harvest WHERE harvest_id = %s', (harvest_id,))
    conn.commit()
    cur.close()
    conn.close()
    return redirect('/harvests')


@app.route('/performs')
def performs():
    conn = get_db_connection()
    cur = conn.cursor()
    cur.execute('SELECT * FROM perform')
    performs = cur.fetchall()
    cur.close()
    conn.close()
    return render_template('perform.html', performs=performs)


@app.route('/add_perform', methods=['POST'])
def add_perform():
    worker_id = request.form['worker_id']
    harvest_id = request.form['harvest_id']
    conn = get_db_connection()
    cur = conn.cursor()
    cur.execute('INSERT INTO perform VALUES (%s, %s)', (worker_id, harvest_id))
    conn.commit()
    cur.close()
    conn.close()
    return redirect('/performs')


@app.route('/queries')
def queries():
    return render_template('queries.html')


@app.route('/run_query', methods=['POST'])
def run_query():
    query_type = request.form['query_type']
    conn = get_db_connection()
    cur = conn.cursor()
    results = []

    try:
        if query_type == 'query1':
            cur.execute("""
                SELECT w.worker_id, w.w_name, w.role, m.task_type, m.m_date,
                       EXTRACT(DAY FROM m.m_date),
                       EXTRACT(MONTH FROM m.m_date),
                       EXTRACT(YEAR FROM m.m_date)
                FROM worker w JOIN maintenace m ON w.worker_id = m.worker_id
            """)
            results = cur.fetchall()

        elif query_type == 'query3':
            cur.execute("""
                SELECT w.worker_id, w.w_name, w.role, COUNT(m.task_type) AS num_of_tasks
                FROM worker w JOIN maintenace m ON w.worker_id = m.worker_id
                GROUP BY w.worker_id, w.w_name, w.role
            """)
            results = cur.fetchall()

        elif query_type == 'query8':
            cur.execute("""
                SELECT DISTINCT w.w_name, w.worker_id
                FROM worker w
                JOIN maintenace m ON w.worker_id = m.worker_id
                JOIN perform p ON w.worker_id = p.worker_id
            """)
            results = cur.fetchall()

        elif query_type == 'func1':
            try:
                year_param = request.form.get('year_param', type=int)
                if not year_param:
                    year_param = 2020  # ברירת מחדל

                cur.execute("""
                    UPDATE worker 
                    SET role = CASE 
                        WHEN Year_of_starting_work <= 5 THEN 'Junior'
                        WHEN Year_of_starting_work > 5 AND Year_of_starting_work <= 15 THEN 'Mid-level'
                        ELSE 'Senior'
                    END
                    WHERE Year_of_starting_work <= %s
                """, (year_param,))

                cur.execute("""
                    SELECT worker_id, w_name, Year_of_starting_work, role
                    FROM worker
                    WHERE Year_of_starting_work <= %s
                    ORDER BY worker_id
                """, (year_param,))

                results = cur.fetchall()
                conn.commit()

                if not results:
                    results = [('לא נמצאו עובדים עם שנות עבודה קטנות או שוות ל-' + str(year_param),)]

            except Exception as e:
                conn.rollback()
                results = [(f"שגיאה: {str(e)}",)]

        elif query_type == 'func2':
            try:
                cutoff_date = request.form.get('date_param', '2025-02-28')
                if not cutoff_date:
                    cutoff_date = '2025-02-28'  # ברירת מחדל

                cur.execute("""
                    UPDATE worker 
                    SET role = CASE 
                        WHEN worker_id IN (
                            SELECT DISTINCT worker_id 
                            FROM maintenace 
                            WHERE task_type = 'pruning' AND m_date <= %s
                        ) THEN 'Pruner'
                        WHEN worker_id IN (
                            SELECT DISTINCT worker_id 
                            FROM maintenace 
                            WHERE task_type = 'harvesting' AND m_date <= %s
                        ) THEN 'Harvester'
                        WHEN worker_id IN (
                            SELECT DISTINCT worker_id 
                            FROM maintenace 
                            WHERE m_date <= %s
                        ) THEN 'General Worker'
                        ELSE role
                    END
                    WHERE worker_id IN (
                        SELECT DISTINCT worker_id 
                        FROM maintenace 
                        WHERE m_date <= %s
                    )
                """, (cutoff_date, cutoff_date, cutoff_date, cutoff_date))

                cur.execute("""
                    SELECT m.task_id, m.task_type, m.m_date, m.worker_id, w.w_name, w.role
                    FROM maintenace m
                    JOIN worker w ON m.worker_id = w.worker_id
                    WHERE m.m_date <= %s
                    ORDER BY m.m_date, m.task_id
                """, (cutoff_date,))

                results = cur.fetchall()
                conn.commit()

                if not results:
                    results = [('לא נמצאו משימות תחזוקה עד תאריך ' + str(cutoff_date),)]

            except Exception as e:
                conn.rollback()
                results = [(f"שגיאה: {str(e)}",)]

        elif query_type == 'proc1':
            try:
                cutoff_date = request.form.get('proc_date_param', '2025-02-28')
                if not cutoff_date:
                    cutoff_date = '2025-02-28'  # ברירת מחדל

                cur.execute("""
                    UPDATE inventory 
                    SET inventory_quantity = inventory_quantity + subq.total_quantity
                    FROM (
                        SELECT h.inventory_id, SUM(h.quantity) as total_quantity
                        FROM harvest h
                        WHERE h.harvest_date <= %s
                        GROUP BY h.inventory_id
                    ) subq
                    WHERE inventory.inventory_id = subq.inventory_id
                """, (cutoff_date,))

                affected_inventory = cur.rowcount

                cur.execute("""
                    UPDATE worker 
                    SET role = 'Harvester'
                    WHERE worker_id IN (
                        SELECT DISTINCT p.worker_id
                        FROM harvest h
                        JOIN perform p ON h.harvest_id = p.harvest_id
                        WHERE h.harvest_date <= %s
                    )
                """, (cutoff_date,))

                affected_workers = cur.rowcount

                cur.execute("""
                    SELECT h.harvest_id, h.harvest_date, h.quantity, h.inventory_id, 
                           p.worker_id, w.w_name, w.role, i.inventory_quantity
                    FROM harvest h
                    JOIN perform p ON h.harvest_id = p.harvest_id
                    JOIN worker w ON p.worker_id = w.worker_id
                    JOIN inventory i ON h.inventory_id = i.inventory_id
                    WHERE h.harvest_date <= %s
                    ORDER BY h.harvest_date, h.harvest_id
                """, (cutoff_date,))

                results = cur.fetchall()
                conn.commit()

                if results:
                    summary_msg = f"הפרוצדורה בוצעה בהצלחה! עודכנו {affected_inventory} פריטי מלאי ו-{affected_workers} עובדים"
                    results.insert(0, (summary_msg, '', '', '', '', '', '', ''))
                else:
                    results = [('לא נמצאו קצירים עד תאריך ' + str(cutoff_date),)]

            except Exception as e:
                conn.rollback()
                results = [(f"שגיאה: {str(e)}",)]

    except Exception as e:
        conn.rollback()
        results = [(f"שגיאה בהרצת השאילתה: {str(e)}",)]

    finally:
        cur.close()
        conn.close()

    return render_template('queries.html', results=results, query_type=query_type)


if __name__ == '__main__':
    app.run(debug=True)
