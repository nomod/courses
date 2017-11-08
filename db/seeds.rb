User.delete_all
User.reset_pk_sequence
User.create(
    [
        {
            user_name: 'Денис',
            surname: 'Рябченко',
            email: 'admin@test.com',
            password: 'qwerty',
            password_confirmation: 'qwerty',
            admin: true
        },
        {
            user_name: 'Тест',
            surname: 'Тестовый',
            email: 'test@test.com',
            password: 'qwerty',
            password_confirmation: 'qwerty',
            admin: false
        },
        {
            user_name: 'Тест2',
            surname: 'Тестовый2',
            email: 'test2@test.com',
            password: 'qwerty',
            password_confirmation: 'qwerty',
            admin: false
        },
    ]
)

Test.delete_all
Test.reset_pk_sequence
Test.create(
    [
        {
            test_name: 'на сообразительность'
        },
        {
            test_name: 'на смекалку'
        },
        {
            test_name: 'на юмор'
        },
    ]
)

Question.delete_all
Question.reset_pk_sequence
Question.create(
    [
        {
            show: '2+2'
        },
        {
            show: '2*2'
        },
        {
            show: '2/2'
        },
        {
            show: '2+2*2'
        },
        {
            show: '2-2*3-2'
        },
        {
            show: '2+(1+3*3)-10*2'
        },
        {
            show: 'на каком языке написан этот вопрос?'
        },
        {
            show: 'продолжить предложение: Ruby on ....'
        },
        {
            show: 'зачем вы здесь?'
        },
    ]
)

Answer.delete_all
Answer.reset_pk_sequence
Answer.create(
    [
        {
            answer: '4'
        },
        {
            answer: '4'
        },
        {
            answer: '1'
        },
        {
            answer: '6'
        },
        {
            answer: '-6'
        },
        {
            answer: '-8'
        },
        {
            answer: 'русский'
        },
        {
            answer: 'Rails'
        },
        {
            answer: 'пройти тест'
        },
    ]
)

Answer_Question.delete_all
Answer_Question.reset_pk_sequence
Answer_Question.create(
    [
        {
            question_id: 1,
            answer_id: 1,
            test_id: 1
        },
        {
            question_id: 2,
            answer_id: 2,
            test_id: 1
        },
        {
            question_id: 3,
            answer_id: 3,
            test_id: 1
        },
        {
            question_id: 4,
            answer_id: 4,
            test_id: 2
        },
        {
            question_id: 5,
            answer_id: 5,
            test_id: 2
        },
        {
            question_id: 6,
            answer_id: 6,
            test_id: 2
        },
        {
            question_id: 7,
            answer_id: 7,
            test_id: 3
        },
        {
            question_id: 8,
            answer_id: 8,
            test_id: 3
        },
        {
            question_id: 9,
            answer_id: 9,
            test_id: 4
        },
    ]
)

Status.delete_all
Status.reset_pk_sequence
Status.create(
    [
        {
            status_name: 'назначено'
        },
        {
            status_name: 'пройден'
        },
    ]
)