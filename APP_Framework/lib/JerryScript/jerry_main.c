/*
 * Copyright (c) 2022 AIIT XUOS Lab
 * XiUOS is licensed under Mulan PSL v2.
 * You can use this software according to the terms and conditions of the Mulan PSL v2.
 * You may obtain a copy of Mulan PSL v2 at:
 *        http://license.coscl.org.cn/MulanPSL2
 * THIS SOFTWARE IS PROVIDED ON AN "AS IS" BASIS, WITHOUT WARRANTIES OF ANY KIND,
 * EITHER EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO NON-INFRINGEMENT,
 * MERCHANTABILITY OR FIT FOR A PARTICULAR PURPOSE.
 * See the Mulan PSL v2 for more details.
 */

/**
 * @file jerry_main.c
 * @brief support jerryscript
 * @version 1.0
 * @author AIIT XUOS Lab
 * @date 2023.08.07
 */

#include <jerryscript.h>
#include <stdio.h>
#include <string.h>
#include <transform.h>

bool js_parse_test1(void* parameter)
{
    bool run_ok = false;

    const jerry_char_t script[] = "var str = 'Hello, World!';";

    /* Initialize engine */
    jerry_init (JERRY_INIT_EMPTY);

    /* Setup Global scope code */
    jerry_value_t parsed_code = jerry_parse (NULL, 0, script, sizeof (script) - 1, JERRY_PARSE_NO_OPTS);

    /* Check if there is any JS code parse error */
    if (!jerry_value_is_error (parsed_code))
    {
        /* Execute the parsed source code in the Global scope */
        jerry_value_t ret_value = jerry_run (parsed_code);

        /* Check the execution return value if there is any error */
        run_ok = !jerry_value_is_error (ret_value);

        /* Returned value must be freed */
        jerry_release_value (ret_value);
        printf("jerry_run ret=%d\n", ret_value);
    }

    /* Parsed source code must be freed */
    jerry_release_value (parsed_code);

    /* Cleanup engine */
    jerry_cleanup ();

    printf("run_ok is %d.\n", run_ok);

    return (run_ok ? 0 : 1);
}

int js_parse_test2(void* parameter)
{
  int return_value = 1;

  /* Initialize engine */
  jerry_init (JERRY_INIT_EMPTY);

  /* Parse the 'function (a,b) { return a + b; }' function */
  const char function_args[] = "a, b";
  const char function_source[] = "return a * b";

  jerry_value_t parsed_function = jerry_parse_function (NULL,
                                                        0,
                                                        (const jerry_char_t *) function_args,
                                                        strlen (function_args),
                                                        (const jerry_char_t *) function_source,
                                                        strlen (function_source),
                                                        JERRY_PARSE_NO_OPTS);

  if (!jerry_value_is_error (parsed_function))
  {
    /* Run the parsed function */
    jerry_value_t args[] = {
        jerry_create_number (3),
        jerry_create_number (55),
    };
    jerry_size_t argc = sizeof (args) / sizeof (args[0]);
    jerry_value_t ret_value = jerry_call_function (parsed_function,
                                                   jerry_create_undefined(),
                                                   args,
                                                   argc);

    /* Process result value */
    if (jerry_value_is_number (ret_value)) {
        double value = jerry_get_number_value (ret_value);
        printf ("Function result: %lf\n", value);

        return_value = !(value == (3 * 55));
    }

    /* Release the function arguments */
    for (jerry_size_t idx = 0; idx < argc; idx++) {
        jerry_release_value (args[idx]);
    }

    /* Returned value must be freed */
    jerry_release_value (ret_value);
  }

  /* Parsed function must be freed */
  jerry_release_value (parsed_function);

  /* Cleanup engine */
  jerry_cleanup ();

  return return_value;
}


int js_parse_test3(void* parameter)
{
  jerry_init (JERRY_INIT_EMPTY);

  jerry_value_t value;
  // create or acquire value
  value = jerry_create_string ((const jerry_char_t *) "Demo string");

  // Read the string into a byte buffer.
  jerry_size_t string_size = jerry_get_string_size (value);
  jerry_char_t *string_buffer_p = (jerry_char_t *) malloc (sizeof (jerry_char_t) * (string_size + 1));

  jerry_size_t copied_bytes = jerry_string_to_char_buffer (value, string_buffer_p, string_size);
  string_buffer_p[copied_bytes] = '\0';

  jerry_release_value (value);

  jerry_cleanup ();

  printf ("Test string: %s\n", string_buffer_p);
  free (string_buffer_p);

  return 0;
}


static int counter = 0;

static jerry_value_t
method_getter (const jerry_value_t this_obj,
               const jerry_value_t func_obj,
               const jerry_value_t args[],
               const jerry_length_t argc)
{
  counter++;
  printf("Getter called, returning: %d\n", counter);

  return jerry_create_number (counter);
}

static jerry_value_t
method_setter (const jerry_value_t this_obj,
               const jerry_value_t func_obj,
               const jerry_value_t args[],
               const jerry_length_t argc)
{
  // Note: the arguments count and type should be checked
  // in this example it is ommitted!

  double new_value = jerry_get_number_value (args[0]);
  counter = (int) new_value;

  printf("Setter called, setting: %d\n", counter);

  return jerry_create_undefined ();
}

int js_parse_test4(void* parameter)
{
  jerry_init (JERRY_INIT_EMPTY);

  jerry_value_t global_obj_val = jerry_get_global_object ();

  // configure the property
  jerry_property_descriptor_t prop_desc;
  jerry_init_property_descriptor_fields (&prop_desc);

  // set the property descriptor fields:

  prop_desc.is_get_defined = true;
  prop_desc.getter = jerry_create_external_function (method_getter);
  prop_desc.is_set_defined = true;
  prop_desc.setter = jerry_create_external_function (method_setter);

  // add the property as "my_prop" for the global object
  jerry_value_t prop_name = jerry_create_string ((const jerry_char_t *) "my_prop");
  jerry_value_t return_value = jerry_define_own_property (global_obj_val, prop_name, &prop_desc);
  if (jerry_value_is_error (return_value))
  {
    // there was an error
  }

  // if there was no error at this point the global object should have a "my_prop" property

  jerry_release_value (return_value);
  jerry_release_value (prop_name);

  jerry_free_property_descriptor_fields (&prop_desc);
  jerry_release_value (global_obj_val);

  // run an example js code to use the getter/setters

  const char *src_p = "this.my_prop; this.my_prop; this.my_prop = 4; this.my_prop";
  jerry_value_t eval_result = jerry_eval ((const jerry_char_t *) src_p, strlen (src_p), JERRY_PARSE_NO_OPTS);

  // "eval_result" is the last result of "this.my_prop" that is "5" currently.
  double result_number = jerry_get_number_value (eval_result);
  printf("output: %lf\n", result_number);

  jerry_cleanup ();

  return result_number != 5.0;
  return 0;
}

void jstest(void)
{
    int ret;
    pthread_t thread;
    pthread_attr_t attr;
    attr.schedparam.sched_priority = 22;
    attr.stacksize = 8192;
    int32 task = 0;
    
    ret = PrivTaskCreate(&thread, &attr, (void*)js_parse_test4, NULL);
    if (ret < 0) {
        printf("taskcreate failed, status=%d\n", ret);
		return;
	} 
}
PRIV_SHELL_CMD_FUNCTION(jstest, jerryscript test cmd, PRIV_SHELL_CMD_FUNC_ATTR);
